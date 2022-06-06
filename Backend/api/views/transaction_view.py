from requests import Session
from api.models.address import Addresses
from api.models.transactions import Transactions
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication
from rest_framework.views import APIView
from buidl.tx import Tx, TxOut, TxIn, RedeemScript
from buidl.hd import *
from rest_framework.response import Response
from rest_framework import status

from api.utils import get_all_transactions


class CreateTransactionView(APIView):

    permission_classes = (IsAuthenticated,)

    def post(self, request):

        amount_to_send = request.data['amount']
        recipient = request.data['recipient']
        utxo = 0
        txn_inputs = []
        user_id = request.user.id
        addresses = Addresses.objects.filter(user_id=user_id).all()
        
        for address in addresses:
            transaction_request = Session().get(
            url=f"https://blockstream.info/testnet/api/address/{address.address_generated}/utxo")
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
            
            if amount_to_send + 1000 <= utxo:
                break

        
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

class GetBroadcastedTransactionsView(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        
        user_id = request.user.id
        addresses = Addresses.objects.filter(user_id=user_id).all()
        broadcasted_transactions = get_all_transactions(addresses, is_broadcasted=True)
        
        return Response({
            "status": status.HTTP_200_OK,
            "transactions" : broadcasted_transactions
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

class GetAllRecievedTransactionsView(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        user_id = request.user.id
        addresses = Addresses.objects.filter(user_id=user_id).all()
        
        transaction_list =[]
        for address in addresses:
            transaction_request = Session().get(
            url=f"https://blockstream.info/testnet/api/address/{address.address_generated}/utxo")
            print(transaction_request.json())
            transactions = [
            {
                "id": i['txid'],
                "amount": i['value'],
                "recipient": address.address_generated,
                "broadcasted": True,
            }
            
            for i in transaction_request.json()
        ]
            transaction_list = transaction_list + transactions

        return Response({
            'status': status.HTTP_200_OK,
            'transactions': transaction_list

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
        

