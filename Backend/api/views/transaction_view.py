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

class CreateTransactionView(APIView):
    
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)
    

    def post(self, request):
    
        address = Addresses.objects.get(address_generated=request.data['address'])
        address_generated = address.address_generated
    
        transaction_request = Session().get(url=f"https://blockstream.info/testnet/api/address/{address_generated}/utxo")
        amount_to_send = request.data['amount']
        recipient = request.data['recipient']
        utxo = 0
        txn_inputs = []

        
        for tran in transaction_request.json():
            if amount_to_send + 1000 >= utxo:

                utxo = utxo + tran['value']
                pub_list = list(address.redeem_script.split(' '))
                pub_list.pop(0)
                pub_list.pop(len(pub_list) - 1)
                pub_list.pop(len(pub_list) - 1)
                redeem=RedeemScript.create_p2sh_multisig(quorum_m=2,pubkey_hexes=pub_list,expected_addr_network='testnet')
                
                inp=TxIn(bytes.fromhex(tran['txid']) , tran['vout'], script_sig=redeem)
                txn_inputs.append(inp)

        output1= TxOut.to_address(recipient, amount_to_send)
        output2= TxOut.to_address(address.address_generated, utxo - amount_to_send + 1000)

        txn=Tx(2, txn_inputs, [output1, output2], network='testnet')
        

        
        if len(request.data['private_keys']) == 2:
            p_k_WIF_1 = request.data['private_keys'][0]
            p_k_WIF_2 = request.data['private_keys'][1]
        else:
            p_k_WIF_2 = address.service_key

        try:
            pkey1=PrivateKey.parse(p_k_WIF_1)
            pkey2=PrivateKey.parse(p_k_WIF_2)
        except:
            return Response(
                {
                    "status":status.BAD_REQUEST,
                    "error": "invalid private key, try validating the keys provided",
                    }
            )

        sig1=txn.get_sig_legacy(0, pkey1, redeem_script=redeem)
        sig2=txn.get_sig_legacy(0, pkey2, redeem_script=redeem)

        inp.finalize_p2sh_multisig([sig1,sig2], redeem)

        txn_hex = txn.serialize().hex()

        transaction = Transactions.objects.create(
            amount_sent=amount_to_send,
            recipient_address= recipient,
            address=address,

            txn_hex= txn_hex,

            txn_fee=txn.fee(),
            transaction_id=txn.id(),
        )

        return Response(
            {"status":status.HTTP_201_CREATED,"transaction":transaction}
        )
    