defmodule CoinbaseProTest do
  use ExUnit.Case
  doctest CoinbasePro

  import Tesla.Mock

  setup do
    mock(fn
      %{method: :get, url: "http://example.com/hello"} ->
        %Tesla.Env{status: 200, body: "hello"}

      %{method: :post, url: "http://example.com/world"} ->
        json(%{"my" => "data"})
    end)

    :ok
  end

  test "greets the world" do
    assert CoinbasePro.products() == :world
  end
end
