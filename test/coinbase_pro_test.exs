defmodule CoinbaseProTest do
  use ExUnit.Case
  doctest CoinbasePro

  test "greets the world" do
    assert CoinbasePro.hello() == :world
  end
end
