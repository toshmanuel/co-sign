from buidl.hd import *
from buidl.script import RedeemScript
from buidl.helper import *

def generatescriptpub(key1,key2,username):
    key3_encode=username.encode()
    key3_mnemonic=HDPrivateKey.from_seed(key3_encode, network='testnet')
    key3_wif=key3_mnemonic.wif()
    key_obj=PrivateKey.parse(key3_wif)
    service_key=key_obj.point.sec().hex()
    pubkey_list=[key1,key2,service_key]
    redeem=RedeemScript.create_p2sh_multisig(quorum_m=2,pubkey_hexes=pubkey_list,expected_addr_network='testnet')
    return redeem.script_pubkey()


