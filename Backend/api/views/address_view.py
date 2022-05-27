from rest_framework import status
from rest_framework.permissions import IsAuthenticated, AllowAny
from api.serializers.address import AddressSerializer
from rest_framework.response import Response
from rest_framework.views import APIView
from api.models.address import Addresses
from django.contrib.auth.models import User
from requests import Session
from api.utils import generateredeemscript, generateservicekey


class GenerateAddress(APIView):
    """This view generates address for new users"""

    permission_classes = (IsAuthenticated,)

    def post(self, request):
        pubkey1 = request.data["key1"]
        pubkey2 = request.data["key2"]
        user_id = request.user.id
        user = User.objects.get(id=user_id)

        print(user_id)
        # user=User.objects.get(id=user_id)
        service_key = generateservicekey()
        redeem = generateredeemscript(pubkey1, pubkey2, service_key)
        addr = redeem.address(network="testnet")
        address = Addresses(
            address_generated=addr,
            user_id=user,
            redeem_script=redeem,
            service_key=service_key,
            key1=pubkey1,
            key2=pubkey2
        )
        address.save()
        return Response(
            {"status": status.HTTP_201_CREATED, "address": address.address_generated}
        )


class ExportAddress(APIView):
    """This view gets the address,
    script pubkey and redeem script, in the case where user want to export address to another wallet"""

    permission_classes = (IsAuthenticated,)

    def get(self, request, address):
        addressinfo = Addresses.objects.filter(address_generated=address)
        serializer = AddressSerializer(addressinfo, many=True)
        redeemscript = serializer.data[0]["redeem_script"]
        return Response(
            {
                "address": serializer.data[0]["address_generated"],
                "redeemscript": redeemscript,
            }
        )


class GetAddressByUser(APIView):
    """This view gets all address by a user"""

    permission_classes = (IsAuthenticated,)

    def get(self, request):
        user_id = request.user.id
        addressinfo = Addresses.objects.filter(user_id=user_id)
        addr = [i.address_generated for i in addressinfo]
        return Response({"addresses": addr})


class GetAddressInfo(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request, address):

        transaction_request = Session().get(
            url=f"https://blockstream.info/testnet/api/address/{address}/utxo"
        )
        body = transaction_request.json()
        addressinfo = [
            {
                "address": address,
                "txid": i["txid"],
                "value": i["value"],
                "vout": i["vout"],
            }
            for i in body
        ]

        return Response(addressinfo)

class GetAllUTXOByAddress(APIView):
    permission_classes=(IsAuthenticated, )

    def get(self, request):
        addresses_utxo=[]
        user_id = request.user.id
        addressinfo = Addresses.objects.filter(user_id=user_id)
        addresses = [i.address_generated for i in addressinfo]
        for address in set(addresses):
            transaction_request = Session().get(url=f"https://blockstream.info/testnet/api/address/{address}/utxo")
            body = transaction_request.json()
            addr_amount=[i["value"]for i in body]
            addresses_utxo.append(sum(addr_amount))
        allutxo=sum(addresses_utxo)

        return Response(allutxo)

class GenerateNewAddress(APIView):
    """This view generates new address for users to avoid address reuse"""
    permission_classes=(IsAuthenticated, )
    def get(self,request):
        user_id = request.user.id
        user = User.objects.get(id=user_id)
        addressinfo = Addresses.objects.get(user_id=user_id)
        pubkey1=addressinfo.key1
        pubkey2=addressinfo.key2
        service_key = generateservicekey()
        redeem = generateredeemscript(pubkey1, pubkey2, service_key)
        addr = redeem.address(network="testnet")
        address = Addresses(
            address_generated=addr,
            user_id=user,
            redeem_script=redeem,
            service_key=service_key,
            key1=pubkey1,
            key2=pubkey2
        )
        address.save()
        return Response(
            {"status": status.HTTP_201_CREATED, "address": address.address_generated}
        )
