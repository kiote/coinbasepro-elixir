defmodule CoinbasePro.Http.PoisonTest do
  use ExUnit.Case
  import CoinbasePro.Http.Poison

  test "gets url" do
    assert [_ | _] = get("http://localhost:8080/products")
  end

  test "failed response" do
    assert {:error, _} = get("http://localhost")
  end
end
