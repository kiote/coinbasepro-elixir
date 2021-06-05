defmodule CoinbasePro do
  @moduledoc """
  General API
  """

  defp api_path() do
    Application.get_env(:coinbase_pro, :api_path, "localhost:8080")
  end

  defp http_client() do
    Coinbase.Http.Poison
  end

  def products() do
    (api_path() <> "/products")
    |> http_client().get()
  end
end
