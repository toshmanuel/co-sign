from rest_framework import serializers
from api.models.address import Addresses

class AddressSerializer(serializers.ModelSerializer):
    class Meta:
        model=Addresses
        fields='__all__'