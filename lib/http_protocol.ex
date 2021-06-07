defmodule CoinbasePro.HttpProtocol do
  @moduledoc """
  Description of HttpProtocol.
  It is needed in case you want to switch from HTTPoison to something else
  """
  @type url() :: String.t()
  @type reason() :: String.t()
  @type response() :: String.t() | list() | map() | {:error, reason()}

  @callback get(url()) :: response()
end
