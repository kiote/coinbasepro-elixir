defmodule CoinbasePro.Http.PoisonTest do
  use ExUnit.Case
  import CoinbasePro.Http.Poison

  test "gets url" do
    assert %{status_code: 200} = get("http://localhost:8080/products")
  end

  test "decodes response" do
    assert %{body: [_ | _]} = get("http://localhost:8080/products") |> response()
  end
end
