defmodule CoinbasePro.Http.Poison do
  @moduledoc """
  Implementation of HttpProtocol for HTTPoison
  """
  require Logger
  alias CoinbasePro.HttpProtocol

  @behaviour HttpProtocol

  def get(url, headers \\ []) do
    HTTPoison.start()

    case HTTPoison.get(url, headers) do
      {:ok, response} ->
        decode(response)

      {:error, reason} ->
        error_string = "Http request failed: #{inspect(reason)}"
        Logger.error(error_string)
        {:error, error_string}
    end
  end

  def post(url, body, headers \\ []) do
    HTTPoison.start()

    case HTTPoison.post(url, body, headers) do
      {:ok, response} ->
        decode(response)

      {:error, reason} ->
        error_string = "Http request failed: #{inspect(reason)}"
        Logger.error(error_string)
        {:error, error_string}
    end
  end

  defp decode(%HTTPoison.Response{body: body}) do
    case Jason.decode(body) do
      {:ok, decoded} ->
        decoded

      {:error, reason} ->
        error_string = "could not decode body: #{inspect(reason)}"
        {:error, error_string}
    end
  end
end
