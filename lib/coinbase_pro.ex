defmodule CoinbasePro do
  @moduledoc """
  General API
  """

  defp api_path do
    Application.get_env(:coinbase_pro, :api_path, "localhost:8080")
  end

  defp http_client do
    CoinbasePro.Http.Poison
  end

  def products do
    (api_path() <> "/products")
    |> http_client().get()
  end

  def get_24h_stats(product) do
    (api_path() <> "/products/" <> product <> "/stats")
    |> http_client().get()
  end

  # see https://docs.pro.coinbase.com/?python#signing-a-message
  def signature(
        %{api_key: api_key, api_passphrase: api_passphrase, secret_key: secret_key},
        %{
          path: path,
          body: body,
          timstamp: timestamp,
          method: method
        }
      ) do
    timestamp = System.system_time(:second)
    method = String.upcase(method)
    data = "#{timestamp}#{method}#{path}#{body}"
    hmac_key = :base64.decode(secret_key)
    sign = :crypto.hmac(:sha256, hmac_key, data) |> :base64.encode()

    [
      {"CB-ACCESS-KEY", api_key},
      {"CB-ACCESS-SIGN", sign},
      {"CB-ACCESS-TIMESTAMP", timestamp},
      {"CB-ACCESS-PASSPHRASE", api_passphrase}
    ]
  end
end
