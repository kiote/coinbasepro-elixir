defmodule Coinbase.Http.Poison do
  alias Coinbase.HttpProtocol

  @behaviour HttpProtocol

  def get(url) do
    HTTPoison.start
    HTTPoison.get!(url)
  end
end
