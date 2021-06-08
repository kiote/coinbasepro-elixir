defmodule CoinbasePro.MixProject do
  use Mix.Project

  def project do
    [
      app: :coinbase_pro,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      dialyzer: dialyzer(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    extra_applications = [:logger]

    extra_applications =
      if Enum.member?([:test], Mix.env()) do
        [:coinbase_pro_http_mock_server | extra_applications]
      else
        extra_applications
      end

    [
      extra_applications: extra_applications,
      mod: {CoinbasePro.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.2"},
      {:httpoison, "~> 1.8"},

      # only test deps
      {:excoveralls, "~> 0.10", only: :test},
      {:coinbase_pro_http_mock_server, "~> 0.1.2", only: :test},
      {:meck, "~> 0.9.2", only: :test},
      # {:coinbase_pro_http_mock_server, path: "../coinbasepro-http-mock-server", only: :test},

      # only dev deps
      {:dialyxir, "~> 1.0", only: :dev, runtime: false},

      # test and dev deps
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false}
    ]
  end

  defp dialyzer do
    [
      plt_core_path: "priv/plts",
      plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
    ]
  end
end
