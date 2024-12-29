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


### Configure the FLAME backend

Configure the flame backend in our configuration or application setup:

```elixir
  # config/prod.exs
  config :flame, :backend, FLAMEGigalixirBackend
```


### Configure clustering

The backend relies on libcluster to communicate between the FLAME Parent and the FLAME workers.

```elixir
  # config/runtime.exs
  config :libcluster,
    topologies: [
      k8s_example: [
        strategy: Cluster.Strategy.Kubernetes,
        config: [
          kubernetes_selector: System.get_env("LIBCLUSTER_KUBERNETES_SELECTOR"),
          kubernetes_node_basename: System.get_env("LIBCLUSTER_KUBERNETES_NODE_BASENAME")]]]
```

Be sure to start up libclustering:
```elixir
  # application.ex
  def start(_type, _args) do
    topologies = Application.get_env(:libcluster, :topologies) || []

    children = [
      {Cluster.Supervisor, [topologies, [name: MyApplication.ClusterSupervisor]]},
      ...
    ]
    ...
  end
```



[flame]:https://github.com/phoenixframework/flame/tree/main
[gigalixir]:https://gigalixir.com
