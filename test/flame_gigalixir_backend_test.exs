defmodule FLAMEGigalixirBackendTest do
  use ExUnit.Case
  doctest FLAMEGigalixirBackend

  test "greets the world" do
    assert FLAMEGigalixirBackend.hello() == :world
  end
end
