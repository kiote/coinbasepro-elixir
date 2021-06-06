defmodule CoinbaseProTest do
  use ExUnit.Case
  doctest CoinbasePro

  test "receives products list" do
    assert %{body: [_head | _tail], status_code: 200} = CoinbasePro.products()
  end
end
