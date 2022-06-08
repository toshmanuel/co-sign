from buidl.hd import *
from buidl.script import RedeemScript
from buidl.helper import *

from api.models.transactions import Transactions


def generateservicekey():
    key3_encode = secure_mnemonic().encode()
    key3_mnemonic = HDPrivateKey.from_seed(key3_encode, network='testnet')
    key3_wif = key3_mnemonic.wif()
    return key3_wif


def generateredeemscript(key1, key2, key3):
    key_obj = PrivateKey.parse(key3)
    service_key = key_obj.point.sec().hex()
    pubkey_list = [key1, key2, service_key]
    redeem = RedeemScript.create_p2sh_multisig(
        quorum_m=2, pubkey_hexes=pubkey_list, expected_addr_network='testnet')
    return redeem


def get_all_transactions(addresses, is_broadcasted=None):
    transaction_list = []
    for address in addresses:
        if is_broadcasted is not None:
            address_transactions = Transactions.objects.filter(
                address_id=address.id, is_broadcasted=is_broadcasted)
        else:
            address_transactions = Transactions.objects.filter(
                address_id=address.id)

        transactions = [
            {
                "id": i.id,
                "recipient": i.recipient_address,
                "amount": i.amount_sent,
                "fee": i.txn_fee,
                "transaction hex": i.txn_hex,
                "date created": i.created_at,
                "broadcasted": i.is_broadcasted,
            }
            for i in address_transactions
        ]
        transaction_list = transaction_list + transactions
    
    return transaction_list
