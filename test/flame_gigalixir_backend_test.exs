defmodule FLAMEGigalixirBackendTest do
  use ExUnit.Case
  doctest FLAMEGigalixirBackend

  alias FLAME.Runner

  def new({backend, opts}) do
    Runner.new(backend: {backend, Keyword.merge([terminator_sup: __MODULE__], opts)})
  end

  setup do
    Application.delete_env(:flame, :backend)
    Application.delete_env(:flame, FLAMEGigalixirBackend)
  end

  test "explicit backend" do
    assert_raise ArgumentError, ~r/missing :token/, fn ->
      new({FLAMEGigalixirBackend, []})
    end

    assert_raise ArgumentError, ~r/missing :app/, fn ->
      new({FLAMEGigalixirBackend, token: "123"})
    end

    assert_raise ArgumentError, ~r/missing :app/, fn ->
      new({FLAMEGigalixirBackend, token: "123"})
    end

    assert new({FLAMEGigalixirBackend, token: "123", app: "app"})
  end

  test "extended opts" do
    opts = [
      token: "123",
      app: "app",
      host: "foo.local",
      env: %{one: 1},
      size: 1.0,
      max_runtime: 45
    ]

    runner = new({FLAMEGigalixirBackend, opts})
    assert {:ok, init} = runner.backend_init
    assert init.host == "foo.local"
    assert init.size == 1.0
    assert init.max_runtime == 45

    assert %{
             one: 1,
             FLAME_PARENT: _,
             PHX_SERVER: "false"
           } = init.env
  end

  test "global configured backend" do
    assert_raise ArgumentError, ~r/missing :token/, fn ->
      Application.put_env(:flame, FLAMEGigalixirBackend, [])
      Runner.new(backend: FLAMEGigalixirBackend)
    end

    assert_raise ArgumentError, ~r/missing :app/, fn ->
      Application.put_env(:flame, FLAMEGigalixirBackend, token: "123")
      Runner.new(backend: FLAMEGigalixirBackend)
    end

    Application.put_env(:flame, :backend, FLAMEGigalixirBackend)
    Application.put_env(:flame, FLAMEGigalixirBackend, token: "123", app: "app")

    assert Runner.new(backend: FLAMEGigalixirBackend)
  end
end
