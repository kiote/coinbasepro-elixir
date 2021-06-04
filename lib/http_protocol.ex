defmodule Coinbase.HttpProtocol do
  @type url() :: String.t()

  @callback get(url()) :: map()
end
