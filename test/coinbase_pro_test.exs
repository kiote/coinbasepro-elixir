defmodule CoinbaseProTest do
  use ExUnit.Case
  doctest CoinbasePro
  import CoinbasePro

  test "receives products list" do
    assert [_head | _tail] = products()
  end

  test "get_24h_stats" do
    assert %{
             "high" => "30265.29",
             "last" => "29943.53",
             "low" => "29715.1",
             "open" => "29733.45",
             "volume" => "17.00318652",
             "volume_30day" => "15131.56489343"
           } = get_24h_stats("BTC-EUR")
  end
end
