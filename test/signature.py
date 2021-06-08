# python function to make sure signing works correct
# if signature from python side matches signature form elixir side
# we assume it's correct
# run it with `python signature.py`
import base64
import hashlib
import hmac
import os
import requests
import time

from requests.auth import AuthBase

# Create custom authentication for Exchange
class CoinbaseExchangeAuth(AuthBase):
    def __init__(self, api_key, secret_key, passphrase):
        self.api_key = api_key
        self.secret_key = secret_key
        self.passphrase = passphrase

    def __call__(self, request):
        timestamp = str(time.time())
        message = timestamp + request.method + request.path_url + (request.body or '')
        # message = message
        hmac_key = base64.b64decode(self.secret_key)
        signature = hmac.new(hmac_key, message, hashlib.sha256)
        signature_b64 = signature.digest().encode('base64').rstrip('\n')

        request.headers.update({
            'CB-ACCESS-SIGN': signature_b64,
            'CB-ACCESS-TIMESTAMP': timestamp,
            'CB-ACCESS-KEY': self.api_key,
            'CB-ACCESS-PASSPHRASE': self.passphrase,
            'Content-Type': 'application/json'
        })
        return request

api_url = 'https://api-public.sandbox.pro.coinbase.com/'
auth = CoinbaseExchangeAuth(os.getenv('CB_SANDBOX_ACCESS_KEY'), os.getenv('CB_SANDBOX_SECRET'), os.getenv('CB_SANDBOX_PASSPHRASE'))

# Get accounts
# r = requests.get(api_url + 'accounts', auth=auth)

# Place an order
order = {
    'type': 'market',
    'side': 'buy',
    'product_id': 'BTC-USD',
    'funds': 50
}
print(order)
r = requests.post(api_url + 'orders', json=order, auth=auth)
print r.json()
# # {"id": "0428b97b-bec1-429e-a94c-59992926778d"}