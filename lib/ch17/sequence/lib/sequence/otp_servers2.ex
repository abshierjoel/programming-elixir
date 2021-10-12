defmodule Sequence.StackServer2 do
  use GenServer

  def init(initial_stack) do
    {:ok, initial_stack}
  end

  def handle_call(:pop, _from, [h | t]), do: {:reply, h, t}
  def handle_cast({:push, item}, state), do: {:noreply, [item | state]}
end
