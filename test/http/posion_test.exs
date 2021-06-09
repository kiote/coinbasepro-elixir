defmodule CoinbasePro.Http.PoisonTest do
  use ExUnit.Case
  import CoinbasePro.Http.Poison

  describe "get" do
    test "gets url" do
      assert [_ | _] = get("http://localhost:8080/products")
    end

    test "failed response" do
      assert {:error, _} = get("http://localhost")
    end
  end

  describe "post" do
    test "failed" do
      assert {:error, _} = post("http://localhost", Jason.encode!(%{}))
    end
  end
end
