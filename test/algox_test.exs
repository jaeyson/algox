defmodule AlgoxTest do
  use ExUnit.Case
  doctest Algox

  test "greets the world" do
    assert Algox.hello() == :world
  end
end
