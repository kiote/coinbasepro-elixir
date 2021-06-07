defmodule CoinbaseProTest do
  use ExUnit.Case
  doctest CoinbasePro

  test "receives products list" do
    assert [_head | _tail] = CoinbasePro.products()
  end
end
