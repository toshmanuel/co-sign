from rest_framework import status
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.views import APIView
from api.models.address import Addresses
from django.contrib.auth.models import User
from api.utils import generatescriptpub, generateservicekey
from buidl.hd import *
from buidl.script import RedeemScript
from buidl.helper import *

class GenerateAddress(APIView):
    permission_classes = (AllowAny,)
    def post(self,request):
        key1 = request.data["key1"]
        key2 = request.data["key2"]
        user_id= request.data['user_id']
        user=User.objects.get(id=user_id)
        username=user.username
        service_key=generateservicekey(username)
        script_pubkey= generatescriptpub(key1,key2,username)
        addr=script_pubkey.address(network='testnet')
        address=Addresses(address_generated=addr,user_id=user,script_pubkey=script_pubkey,service_key=service_key)
        address.save()
        return Response(
            {"status":status.HTTP_201_CREATED,"address":addr}
        )

# class GetAddressListbyUser
#Get address info, add the fund in the address




#         {
# "key1":"030f92f64022d0652e5ee52ea7808ac4094048e31d6d57253a97e704bca732965a",
# "key2":"03fcc838ee61cf638f5542daa76a67fe82f2f3b907d9e3772636cf0f113f90093e",
# "user_id":1

# }


