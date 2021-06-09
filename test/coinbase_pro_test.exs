defmodule CoinbaseProTest do
  use ExUnit.Case

  doctest CoinbasePro

  import CoinbasePro

  setup do
    on_exit(fn -> :meck.unload() end)
    :ok
  end

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

  test "accounts" do
    assert [
             %{
               "available" => "0",
               "balance" => "0.0000000000000000",
               "currency" => "BAT",
               "hold" => "0.0000000000000000",
               "id" => "5e85456a-5114-4081-ae3d-f01806d8d887",
               "profile_id" => "eed226e5-aef2-4825-b3bb-2bfeb2d154d2",
               "trading_enabled" => true
             },
             %{
               "available" => "0",
               "balance" => "0.0000000000000000",
               "currency" => "BTC",
               "hold" => "0.0000000000000000",
               "id" => "fccc62c0-2ef1-4a76-80e1-4df10826a4bc",
               "profile_id" => "eed226e5-aef2-4825-b3bb-2bfeb2d154d2",
               "trading_enabled" => true
             },
             %{
               "available" => "0",
               "balance" => "0.0000000000000000",
               "currency" => "ETH",
               "hold" => "0.0000000000000000",
               "id" => "de804e2f-e41b-47dd-ad36-e487da861f1d",
               "profile_id" => "eed226e5-aef2-4825-b3bb-2bfeb2d154d2",
               "trading_enabled" => true
             },
             %{
               "available" => "0",
               "balance" => "0.0000000000000000",
               "currency" => "EUR",
               "hold" => "0.0000000000000000",
               "id" => "189ea2ef-2800-44b5-8940-ccdd55c22889",
               "profile_id" => "eed226e5-aef2-4825-b3bb-2bfeb2d154d2",
               "trading_enabled" => true
             },
             %{
               "available" => "0",
               "balance" => "0.0000000000000000",
               "currency" => "GBP",
               "hold" => "0.0000000000000000",
               "id" => "ad460a02-78b3-46c1-9852-b1ee5c9a6120",
               "profile_id" => "eed226e5-aef2-4825-b3bb-2bfeb2d154d2",
               "trading_enabled" => true
             },
             %{
               "available" => "0",
               "balance" => "0.0000000000000000",
               "currency" => "LINK",
               "hold" => "0.0000000000000000",
               "id" => "c43f1ec3-43c8-4c86-8b8a-cb38e8ab697d",
               "profile_id" => "eed226e5-aef2-4825-b3bb-2bfeb2d154d2",
               "trading_enabled" => true
             },
             %{
               "available" => "0",
               "balance" => "0.0000000000000000",
               "currency" => "USD",
               "hold" => "0.0000000000000000",
               "id" => "b4ec1757-ff55-4dc8-9f22-dc3e8d2f3894",
               "profile_id" => "eed226e5-aef2-4825-b3bb-2bfeb2d154d2",
               "trading_enabled" => true
             },
             %{
               "available" => "0",
               "balance" => "0.0000000000000000",
               "currency" => "USDC",
               "hold" => "0.0000000000000000",
               "id" => "f807caae-c283-4470-8da6-3b785a4984f1",
               "profile_id" => "eed226e5-aef2-4825-b3bb-2bfeb2d154d2",
               "trading_enabled" => true
             }
           ] = accounts()
  end

  test "signature_headers" do
    :meck.new(System)
    mocked_time = 1_623_139_729
    :meck.expect(System, :system_time, fn _ -> mocked_time end)

    assert [
             {"CB-ACCESS-KEY", "dummy"},
             {"CB-ACCESS-SIGN", "qo56ti2wUQKXt5uEdUlu1yxmdqvWF5ccZTu185PyZXw="},
             {"CB-ACCESS-TIMESTAMP", ^mocked_time},
             {"CB-ACCESS-PASSPHRASE", "too_dummy"},
             {"Content-Type", "application/json"}
           ] =
             signature_headers(
               %{
                 api_key: "dummy",
                 api_passphrase: "too_dummy",
                 secret_key: :base64.encode("secret_key")
               },
               %{
                 path: "/accounts",
                 body: "",
                 timestamp: mocked_time,
                 method: "GET"
               }
             )
  end

  test "buy_btc_on" do
    assert %{
             "created_at" => "2021-06-09T17:08:08.914382Z",
             "executed_value" => "0",
             "fill_fees" => "0",
             "filled_size" => "0",
             "funds" => "49.75124378",
             "id" => "b4a2955e-3de9-4fb6-b864-9ac2cae96c56",
             "post_only" => false,
             "product_id" => "BTC-EUR",
             "settled" => false,
             "side" => "buy",
             "specified_funds" => "50",
             "status" => "pending",
             "stp" => "dc",
             "type" => "market"
           } = buy_btc_on(%{eur: 50})
  end
end
