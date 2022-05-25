from rest_framework import serializers
from buidl.tx import *
import requests
from io import *

from api.models.transactions import Transactions, Addresses

NETWORK='testnet'

class TransactionSerializer(serializers.ModelSerializer):
     class Meta:
        model = Transactions
        fields = ('amount', 'recipient', 'address')

    # def validate(self, attrs):
    #     if attrs['amount'] <= 0:
    #         raise serializers.ValidationError(
    #             {"amount": "amount can not be less than 0"}
    #         )
    #     return attrs
     def create(self, validated_data):
        print(validated_data['address'])
        address = Addresses.objects.get(address_generated=validated_data['address'])
        address_generated = address.address_generated
        print(address_generated)
        transaction_request = requests.Session().get(url=f"https://blockstream.info/testnet/api/address/{address_generated}/utxo")
        amount_to_send = validated_data['amount']
        recipient = validated_data['recipient']
        utxo = 0
        txn_inputs = []
        txn_input_ids = []
        for tran in transaction_request.json():
            if amount_to_send + 1000 >= utxo:
                txn_input_ids.append(tran['txid'])
                utxo = utxo + tran['value']
                pub_list = list(address.redeem_script.split(' '))
                print(pub_list)
                print(len(pub_list))
                pub_list.pop(0)
                pub_list.pop(len(pub_list) - 1)
                pub_list.pop(len(pub_list) - 1)
                print(pub_list)
                redeem=RedeemScript.create_p2sh_multisig(quorum_m=2,pubkey_hexes=pub_list,expected_addr_network='testnet')
                
                inp=TxIn(bytes.fromhex(tran['txid']) , tran['vout'], script_sig=redeem)
                print(inp)
                txn_inputs.append(inp)

        print(utxo)
        print(txn_inputs)
        print(txn_input_ids)
        output1= TxOut.to_address(recipient, amount_to_send)
        output2= TxOut.to_address(address.address_generated, utxo - amount_to_send + 1000)

        txn=Tx(2, txn_inputs, [output1, output2], network='testnet')
       
        transaction = Transactions.objects.create(
            amount_sent=amount_to_send,
            recipient_address= recipient,
            address=address,
            txn_input= ' '.join(txn_input_ids),
            txn_fee=txn.fee(),
            transaction_id=txn[dict(txn)['tx']],
        )

        return transaction