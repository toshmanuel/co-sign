from rest_framework import status
from rest_framework.permissions import AllowAny
from api.serializers.address import AddressSerializer
from rest_framework.response import Response
from rest_framework.views import APIView
from api.models.address import Addresses
from django.contrib.auth.models import User
from api.utils import generateredeemscript, generateservicekey
from buidl.script import RedeemScript


class GenerateAddress(APIView):
    """This view generates address from the user keys and service key"""
    permission_classes = (AllowAny,)
    def post(self,request):
        key1 = request.data["key1"]
        key2 = request.data["key2"]
        user_id= request.data['user_id']
        user=User.objects.get(id=user_id)
        username=user.username
        service_key=generateservicekey(username)
        redeem= generateredeemscript(key1,key2,username)
        addr=redeem.address(network='testnet')
        address=Addresses(address_generated=addr,user_id=user,redeem_script=redeem,service_key=service_key)
        address.save()
        
        return Response(
            {"status":status.HTTP_201_CREATED,"address":address.address_generated}
        )

class GetAddressInfo(APIView):
    """This view gets the address,
    script pubkey and redeem script, in the case where user want to import address to another wallet"""
    permission_classes=(AllowAny,)
    def get(self,request,address):
        addressinfo=Addresses.objects.filter(address_generated=address)
        serializer=AddressSerializer(addressinfo, many=True)
        return Response(
            {"address":serializer.data[0]["address_generated"], "redeemscript":serializer.data[0]["redeem_script"]}
            )

