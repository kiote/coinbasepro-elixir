defmodule CoinbasePro.Http.PoisonTest do
  use ExUnit.Case
  import :meck
  import CoinbasePro.Http.Poison

  setup do
    new(:hackney)
    new(Jason)
    on_exit(fn -> unload() end)
    :ok
  end

  @tag :only
  test "gets url" do
    # ip = {127, 1, 2, 3}
    expect(:hackney, :request, 5, {:ok, 200, "headers", :client})
    expect(:hackney, :body, 2, "")
    # expect(:cowboy_req, :parse_header, 2, :undefined)
    # expect(JSX, :encode!, [{[[origin: "127.1.2.3"]], :json}])

    get("http://localhost") |> IO.inspect()

    # assert validate(:cowboy_req)
    # assert validate(JSX)
  end
end
