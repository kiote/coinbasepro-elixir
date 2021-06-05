defmodule CoinbaseProTest do
  use ExUnit.Case
  doctest CoinbasePro

  test "greets the world" do
    assert %HTTPoison.Response{status_code: 200} = CoinbasePro.products()
  end
end
