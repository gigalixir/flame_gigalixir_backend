defmodule FLAMEGigalixirBackend.MixProject do
  use Mix.Project

  @source_url "https://github.com/gigalixir/flame_gigalixir_backend"
  @version "0.1.0"

  def project do
    [
      app: :flame_gigalixir_backend,
      description: "A FLAME backend for Gigalixir",
      version: @version,
      elixir: "~> 1.15",
      elixirc_paths: ["lib"],
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      docs: [
        main: "readme",
        extras: ["README.md", "CHANGELOG.md"],
        source_ref: "v#{@version}",
        source_url: @source_url
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:flame, "~> 0.4.0 or ~> 0.5.0"},
      {:jason, ">= 0.0.0"},
    ]
  end

  defp package do
    [
      name: :flame_gigalixir_backend,
      maintainers: ["Gigalixir"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url,
      },
      files: ["lib", "mix.exs", "README*", "LICENSE*", "CHANGELOG.md"]
    ]
  end
end
