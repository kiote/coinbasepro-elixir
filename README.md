# CoinbasePro

[![codecov](https://codecov.io/gh/kiote/coinbasepro-elixir/branch/master/graph/badge.svg)](https://codecov.io/gh/kiote/coinbasepro-elixir)

Elixir client library for [CoinbasePro](https://docs.pro.coinbase.com/)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `coinbase_pro` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:coinbase_pro, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/coinbase_pro](https://hexdocs.pm/coinbase_pro).

## Ideas in this code

### Heavily relies on Sandbox

Coinbase offers [Sandbox](https://public.sandbox.pro.coinbase.com/) for testing purposes. This library communicates with sandbox by default. You can get API credential for the sandbox the same way as for production.

### Should not be coupled to HTTP client

There are several good HTTP clients for Elixir / Erlang. To not force a decision which one is the best, this code uses idea of [behavours](https://elixir-lang.org/getting-started/typespecs-and-behaviours.html) to support them all.

Currently only HTTPoison supprt is implemented though.

### Tests are using external mocking service

There are several ways to test communication with external services: mocking with [Mox](https://hexdocs.pm/mox/Mox.html) for example. This library use an approach to mock all needed responses in a local server. You can read more about this approach here: https://developers.amadeus.com/blog/helpful-tools-to-create-mock-servers. Mocking server can be found here: https://github.com/kiote/coinbasepro-http-mock-server

