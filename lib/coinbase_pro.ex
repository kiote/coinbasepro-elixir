defmodule CoinbasePro do
  @moduledoc """
  General API
  """

  defp api_path() do
    "https://api-public.sandbox.pro.coinbase.com"
  end

  defp http_client() do
    Coinbase.Http.Poison
  end

  def products() do
    api_path() <> "/products"
    |> http_client().get()
  end
end
