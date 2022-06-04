from requests import Session
from api.models.address import Addresses
from api.models.transactions import Transactions
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication
from rest_framework.views import APIView
from buidl.tx import Tx, TxOut, TxIn, RedeemScript
from buidl.hd import *
from buidl.psbt import *
from rest_framework.response import Response
from rest_framework import status

from api.utils import get_all_transactions, CheckNodeConnection


class CreateTransactionView(APIView):

    permission_classes = (IsAuthenticated,)

    def post(self, request):

        address = Addresses.objects.get(
            address_generated=request.data['address'])
        address_generated = address.address_generated
        print(address_generated)

        transaction_request = Session().get(
            url=f"https://blockstream.info/testnet/api/address/{address_generated}/utxo")
        print(transaction_request.json())
        amount_to_send = request.data['amount']
        recipient = request.data['recipient']
        utxo = 0
        txn_inputs = []

        for tran in transaction_request.json():
            if amount_to_send + 1000 >= utxo:

                utxo = utxo + tran['value']
                pub_list = list(address.redeem_script.split(' '))

                pub_list.pop(0)
                while len(pub_list) > 3:
                    pub_list.pop(len(pub_list) - 1)

                redeem = RedeemScript.create_p2sh_multisig(
                    quorum_m=2, pubkey_hexes=pub_list, expected_addr_network='testnet')
                print(redeem)

                inp = TxIn(bytes.fromhex(
                    tran['txid']), tran['vout'], script_sig=redeem)
                txn_inputs.append(inp)

        print(utxo)
        fee = (len(txn_inputs) + 2) * 146 + 2 * 34 + 20
        print(fee)
        output1 = TxOut.to_address(recipient, amount_to_send)
        output2 = TxOut.to_address(
            address.address_generated, utxo - (amount_to_send + fee))

        txn = Tx(2, txn_inputs, [output1, output2], network='testnet')

        if len(request.data['private_keys']) == 2:
            p_k_WIF_1 = request.data['private_keys'][0]
            p_k_WIF_2 = request.data['private_keys'][1]
        else:
            p_k_WIF_1 = request.data['private_keys'][0]
            p_k_WIF_2 = address.service_key

        try:
            print(p_k_WIF_1)
            print(p_k_WIF_2)
            pkey1 = PrivateKey.parse(p_k_WIF_1)
            pkey2 = PrivateKey.parse(p_k_WIF_2)
        except:
            return Response(
                {
                    "status": status.BAD_REQUEST,
                    "error": "invalid private key, try validating the keys provided",
                }
            )

        for i in range(len(txn_inputs)):
            sig1 = txn.get_sig_legacy(i, pkey1, redeem_script=redeem)
            sig2 = txn.get_sig_legacy(i, pkey2, redeem_script=redeem)
            txn_inputs[i].finalize_p2sh_multisig([sig1, sig2], redeem)

        txn_hex = txn.serialize().hex()

        transaction = Transactions.objects.create(
            amount_sent=amount_to_send,
            recipient_address=recipient,
            address=address,
            txn_hex=txn_hex,
            txn_fee=txn.fee(),
        )

        return Response(
            {
                "status": status.HTTP_201_CREATED,
                "transaction id": transaction.transaction_id,
                "fee": txn.fee(),
                "amount": transaction.amount_sent,
                "recipient": transaction.recipient_address,
                "transaction hex": txn_hex,
                "broadcasted": False,
            }
        )


class BroadcastTransactionView(APIView):
    permission_classes = (IsAuthenticated,)

    def post(self, request, transaction_id):
        transaction = Transactions.objects.get(id=transaction_id)
        txn_hex = transaction.txn_hex

        tnx_pub_req = Session().post(
            url='https://blockstream.info/testnet/api/tx', data=txn_hex)

        txn_id = tnx_pub_req.text
        print(txn_id)
        transaction.tx_id = txn_id
        transaction.is_broadcasted = True
        transaction.save()
        print(transaction.tx_id)

        return Response(
            {
                "status": status.HTTP_200_OK,
                "transaction": txn_id,
                "broadcasted": True,
            }
        )


class GetUnBroadcastTransactionsView(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        
        user_id = request.user.id
        addresses = Addresses.objects.filter(user_id=user_id).all()
        unbroadcast_transactions = get_all_transactions(addresses, is_broadcasted=False)
        
        return Response({
            "status": status.HTTP_200_OK,
            "transactions" : unbroadcast_transactions
        })

class GetAllTransactionsView(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        user_id = request.user.id
        addresses = Addresses.objects.filter(user_id=user_id).all()
        transaction_list = get_all_transactions(addresses)
        return Response({
            "status": status.HTTP_200_OK,
            "transactions" : transaction_list
        })

class TransactionDetailsView(APIView):

    permission_classes = (IsAuthenticated,)

    def get(self, request, transaction_id):
        transaction = Transactions.objects.get(id=transaction_id)

        return Response({
            "status" : status.HTTP_200_OK,
            "transaction": {
                "id": transaction.id,
                "recipient": transaction.recipient_address,
                "amount": transaction.amount_sent,
                "fee": transaction.txn_fee,
                "date created": transaction.created_at,
                "broadcasted": transaction.is_broadcasted,
            }
        })

class CreatePSBT(APIView):

    permission_classes = (IsAuthenticated,)

    def post(self, request):
        recipient = request.data['recipient']
        amount = request.data['amount']
        user_id = request.user.id
        addresses = Addresses.objects.filter(user_id=user_id)
        addresses = [i.address_generated for i in addresses]
        for address in set(addresses):
            transaction_request = Session().get(
                url=f"https://blockstream.info/testnet/api/address/{address}/utxo")
            body = transaction_request.json()
        
        address = Addresses.objects.get(
          address_generated=request.data['address'])
        address_generated = address.address_generated
        pub_list = list(address.redeem_script.split(' '))
        pub_list.pop(0)
        while len(pub_list) > 3:
            pub_list.pop(len(pub_list) - 1)
        rpc=CheckNodeConnection("testnet","bitcoin","bitcoin")
        rpc.addmultisigaddress(2,pub_list)
        rpc.importaddress(address_generated,'testing',False)

    
        transaction_request = Session().get(
            url=f"https://blockstream.info/testnet/api/address/{address_generated}/utxo")
        body=transaction_request.json()
        tx_id=[{'txid':i['txid'],'value':i['value'],'vout':i['vout']}for i in body]
        input=[]
        utxo=0
        
        for i in tx_id:
            if utxo <= amount:
                utxo +=i['value']
                txinp={'txid':i['txid'],'vout':i['vout']}
                input.append(txinp)

        amount=amount/100000000
        output={recipient:amount}
        watching={"includeWatching":True}
        cv=rpc.walletcreatefundedpsbt(input,[output],0,watching)
        psbt=cv['psbt']



        psbt_obj = PSBT.parse_base64(psbt, network='testnet')

        service_key=address.service_key

        psbt_obj.sign_with_private_keys([service_key])

        try:
            
            psbt_hex = psbt_obj.serialiaze_base64()
            
            Transactions.objects.create(
                address=address,
                txn_hex=psbt_hex,
            )

            return Response({
                'status': status.HTTP_201_CREATED,
                'psbt': str(psbt_hex) 
            })

        except Exception as e:
            return Response({
                'error': str(e)
            })



        

