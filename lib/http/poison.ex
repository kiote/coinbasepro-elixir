defmodule Coinbase.Http.Poison do
  @moduledoc """
  Implementation of HttpProtocol for HTTPoison
  """
  alias Coinbase.HttpProtocol

  @behaviour HttpProtocol

  def get(url) do
    HTTPoison.start()
    HTTPoison.get!(url)
  end

  def response(%HTTPoison.Response{body: body, status_code: status_code}) do
    %{body: body, status_code: status_code}
  end
end
