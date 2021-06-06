defmodule Coinbase.HttpProtocol do
  @moduledoc """
  Description of HttpProtocol.
  It is needed in case you want to switch from HTTPoison to something else
  """
  @type url() :: String.t()
  @type response() ::
          %{body: String.t(), status_code: integer()}
          | %{body: list(), status_code: integer()}
          | %{body: map(), status_code: integer()}

  @callback get(url()) :: map()

  @callback response(map()) :: response()
end
