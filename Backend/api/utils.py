from buidl.hd import *
from buidl.script import RedeemScript
from buidl.helper import *


def generateservicekey():
    key3_encode=secure_mnemonic().encode()
    key3_mnemonic=HDPrivateKey.from_seed(key3_encode, network='testnet')
    key3_wif=key3_mnemonic.wif()
    return key3_wif

def generateredeemscript(key1,key2,key3):
    key_obj=PrivateKey.parse(key3)
    service_key=key_obj.point.sec().hex()
    pubkey_list=[key1,key2,service_key]
    redeem=RedeemScript.create_p2sh_multisig(quorum_m=2,pubkey_hexes=pubkey_list,expected_addr_network='testnet')
    return redeem
