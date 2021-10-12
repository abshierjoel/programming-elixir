defmodule Sequence.StackServer1 do
  use GenServer

  def init(initial_stack) do
    {:ok, initial_stack}
  end

  def handle_call(:pop, _from, state) do
    [h | t] = state
    {:reply, h, t}
  end
end
