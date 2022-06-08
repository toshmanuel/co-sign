from requests import Session
from api.models.address import Addresses
from api.models.transactions import Transactions
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from buidl.tx import Tx, TxOut, TxIn, RedeemScript
from buidl.hd import *
from buidl.psbt import *
from rest_framework.response import Response
from rest_framework import status

from api.utils import CheckNodeConnection

NETWORK = 'testnet'


class SignPSBTransactionView(APIView):

    permission_classes = (IsAuthenticated,)

    def post(self, request):
        psbt = request.data['psbt']
        user_id = request.user.id

        psbt_obj = PSBT.parse_base64(psbt, network=NETWORK)

        psbt_in = psbt_obj.psbt_ins
        redeem_script = str(psbt_in[0].redeem_script)

        found_address = Addresses.objects.filter(
            user_id=user_id, redeem_script=redeem_script)[0]
        print(found_address)
        service_key = PrivateKey.parse(found_address.service_key)


        psbt_obj.sign_with_private_keys([service_key])

        try:
            print(psbt_obj.validate())
            
            psbt_obj.finalize()
            tx_obj = psbt_obj.final_tx()
            psbt_hex = tx_obj.serialize().hex()
            
            transaction = Transactions.objects.create(
                address=found_address,
                txn_hex=psbt_hex,
            )

            return Response({
                'status': status.HTTP_200_OK,
                'txn_hex': psbt_hex,
            })

        except Exception as e:
            return Response({
                'error': str(e),
                'psbt' : psbt_obj.serialize_base64()
            })

class CreatePSBT(APIView):

    permission_classes = (IsAuthenticated,)

    def post(self, request):
        recipient = request.data['recipient']
        amount = request.data['amount']
        user_id = request.user.id
        addresses = Addresses.objects.filter(user_id=user_id).all()
        # address = Addresses.objects.get(
        #     address_generated=request.data['address'])
        # address_generated = address.address_generated
        for address in addresses:
            transaction_request = Session().get(
            url=f"https://blockstream.info/testnet/api/address/{address.address_generated}/utxo")
            input=[]
            utxo=0
            for tran in transaction_request.json():
                if amount + 1000 >= utxo:

                    utxo = utxo + tran['value']
                    pub_list = list(address.redeem_script.split(' '))

                    pub_list.pop(0)
                    while len(pub_list) > 3:
                        pub_list.pop(len(pub_list) - 1)
                    
                    rpc=CheckNodeConnection("testnet","bitcoin","bitcoin")
                    rpc.addmultisigaddress(2,pub_list)
                    rpc.importaddress(address.address_generated,'testing',False)

                

                    txinp={"txid":tran['txid'],"vout":tran['vout']}
                    input.append(txinp)
                    
            if amount + 1000 <= utxo:
                break
            
        amount=amount/100000000
        output={recipient:amount}
        watching={"includeWatching":True}
        print(input)
        cv=rpc.walletcreatefundedpsbt(input,[output],0,watching)
        psbt=cv['psbt']
        print(amount)



        psbt_obj = PSBT.parse_base64(psbt, network='testnet')
        print(psbt_obj)

        service_key=address.service_key
        service_key = PrivateKey.parse(service_key)
        psbt_obj.sign_with_private_keys([service_key])

        try:
            
            psbt_hex = psbt_obj.serialize_base64()
            
            transaction = Transactions.objects.create(
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

