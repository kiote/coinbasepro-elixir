import Config

config :coinbase_pro,
  api_path: "https://api-public.sandbox.pro.coinbase.com",
  api_key: System.get_env("CB_SANDBOX_ACCESS_KEY"),
  api_passphrase: System.get_env("CB_SANDBOX_PASSPHRASE"),
  secret_key: System.get_env("CB_SANDBOX_SECRET")

import_config("#{Mix.env()}.exs")
