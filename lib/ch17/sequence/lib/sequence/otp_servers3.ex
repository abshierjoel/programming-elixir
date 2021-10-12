defmodule Sequence.StackServer3 do
  use GenServer

  def start_link(initial_stack),
    do: GenServer.start_link(__MODULE__, initial_stack, name: __MODULE__)

  def init(init), do: {:ok, init}
  def handle_call(:pop, _from, [h | t]), do: {:reply, h, t}
  def handle_cast({:push, item}, state), do: {:noreply, [item | state]}
end
