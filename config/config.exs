import Config

config :coinbase_pro,
  api_path: "https://api-public.sandbox.pro.coinbase.com"

import_config("#{Mix.env()}.exs")
