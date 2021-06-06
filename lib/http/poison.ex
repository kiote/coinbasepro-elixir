defmodule CoinbasePro.Http.Poison do
  @moduledoc """
  Implementation of HttpProtocol for HTTPoison
  """
  alias CoinbasePro.HttpProtocol

  @behaviour HttpProtocol

  def get(url) do
    HTTPoison.start()
    HTTPoison.get!(url)
  end

  def response(%HTTPoison.Response{body: body, status_code: status_code}) do
    %{body: Jason.decode!(body), status_code: status_code}
  end
end
