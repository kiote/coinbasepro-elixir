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

  test "signature" do
    :meck.new(System)
    mocked_time = 1_623_139_729
    :meck.expect(System, :system_time, fn _ -> mocked_time end)

    assert [
             {"CB-ACCESS-KEY", "dummy"},
             {"CB-ACCESS-SIGN", "6refuUAL4v8BEq5sHM6w7ZG4elMPHeU3aE4JfdBgDuo="},
             {"CB-ACCESS-TIMESTAMP", ^mocked_time},
             {"CB-ACCESS-PASSPHRASE", "too_dummy"}
           ] =
             signature(
               %{
                 api_key: "dummy",
                 api_passphrase: "too_dummy",
                 secret_key: :base64.encode("secret_key")
               },
               %{
                 path: "path",
                 body: "",
                 timstamp: "timestamp",
                 method: "method"
               }
             )

    :meck.unload()
  end
end
