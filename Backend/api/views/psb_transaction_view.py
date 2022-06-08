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

from api.utils import get_all_transactions

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

