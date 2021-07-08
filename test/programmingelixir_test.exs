defmodule ProgrammingelixirTest do
  use ExUnit.Case
  doctest Programmingelixir

  test "greets the world" do
    assert Programmingelixir.hello() == :world
  end
end
