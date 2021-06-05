defmodule CoinbasePro.MixProject do
  use Mix.Project

  def project do
    [
      app: :coinbase_pro,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {CoinbasePro.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.8"},

      # only test deps
      {:excoveralls, "~> 0.10", only: :test},

      # only dev deps
      {:dialyxir, "~> 1.0", only: :dev, runtime: false},

      # test and dev deps
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false}
    ]
  end
end
