defmodule Sequence.StackServer4 do
  use GenServer

  #####
  # External API

  def start_link(initial_stack),
    do: GenServer.start_link(__MODULE__, initial_stack, name: __MODULE__)

  def pop(), do: GenServer.call(__MODULE__, :pop)
  def push(item), do: GenServer.cast(__MODULE__, {:push, item})

  #####
  # GenServer implementation
  def init(init), do: {:ok, init}
  def handle_call(:pop, _from, [h | t]), do: {:reply, h, t}
  def handle_cast({:push, item}, state), do: {:noreply, [item | state]}
end
