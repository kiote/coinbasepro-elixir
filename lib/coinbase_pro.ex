defmodule CoinbasePro do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://api-public.sandbox.pro.coinbase.com"
  plug Tesla.Middleware.Headers, [{"User-Agent", "CoinbaseProElixirClient"}]
  plug Tesla.Middleware.JSON

  def products() do
    case get("/products/") do
      {:ok, %Tesla.Env{status: 200, body: body}} ->
        {:ok, body}

      {:ok, %Tesla.Env{status: status, body: body}} ->
        {:error, body}
    end
  end
end
