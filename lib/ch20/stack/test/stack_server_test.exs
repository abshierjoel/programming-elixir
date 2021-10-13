defmodule Stack.StackServerTest do
  use ExUnit.Case
  alias Stack.StackServer

  test "push/pop adds to the head and returns it" do
    StackServer.push(12345)
    assert 12345 = StackServer.pop()
  end

  test "push/pop is FIFO" do
    StackServer.push(:first)
    StackServer.push(:second)
    StackServer.push(:third)
    assert :third = StackServer.pop()
    assert :second = StackServer.pop()
    assert :first = StackServer.pop()
  end
end
