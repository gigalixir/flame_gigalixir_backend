# FLAMEGigalixirBackend

A [FLAME][flame] Backend for [Gigalixir][gigalixir], Elixir’s Platform as a Service.

[![Module Version](https://img.shields.io/hexpm/v/flame_gigalixir_backend.svg)](https://hex.pm/packages/flame_gigalixir_backend)
[![Last Updated](https://img.shields.io/github/last-commit/gigalixir/flame_gigalixir_backend.svg)](https://github.com/gigalixir/flame_gigalixir_backend/commits/main)

[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/flame_gigalixir_backend/)
[![Total Download](https://img.shields.io/hexpm/dt/flame_gigalixir_backend.svg)](https://hex.pm/packages/flame_gigalixir_backend)
[![License](https://img.shields.io/hexpm/l/flame_gigalixir_backend.svg)](https://github.com/mruoss/flame_gigalixir_backend/blob/main/LICENSE)

## Installation

```elixir
def deps do
  [
    {:flame_gigalixir_backend, "~> 0.1.0"}
  ]
end
```

## Usage

Configure the flame backend in our configuration or application setup:

```elixir
  # prod.exs
  config :flame, :backend, FLAMEGigalixirBackend
```



[flame]:https://github.com/phoenixframework/flame/tree/main
[gigalixir]:https://gigalixir.com
