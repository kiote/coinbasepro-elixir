# python function to make sure signing works correct
# if signature from python side matches signature form elixir side
# we assume it's correct
# run it with `python signature.py`
import hmac
import hashlib
import time
import base64

def get_auth_headers(timestamp, message, api_key, secret_key, passphrase):
    message = message.encode('ascii')
    hmac_key = base64.b64decode(secret_key)
    signature = hmac.new(hmac_key, message, hashlib.sha256)
    signature_b64 = base64.b64encode(signature.digest()).decode('utf-8')
    return {
        'Content-Type': 'Application/JSON',
        'CB-ACCESS-SIGN': signature_b64,
        'CB-ACCESS-TIMESTAMP': timestamp,
        'CB-ACCESS-KEY': api_key,
        'CB-ACCESS-PASSPHRASE': passphrase
    }

print(get_auth_headers(1623139729, "1623139729GET/accounts", "dummy", "c2VjcmV0X2tleQ==", "too_dummy"))