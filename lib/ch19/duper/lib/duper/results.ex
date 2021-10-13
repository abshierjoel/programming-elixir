defmodule Duper.Results do
  use GenServer

  # API
  def start_link(_), do: GenServer.start_link(__MODULE__, :no_args, name: __MODULE__)
  def add_hash_for(path, hash), do: GenServer.cast(__MODULE__, {:add, path, hash})
  def find_duplicates(), do: GenServer.call(__MODULE__, :find_duplicates)

  # Server

  def init(:no_args), do: {:ok, %{}}

  def handle_cast({:add, path, hash}, state) do
    results = Map.update(state, hash, [path], &[path | &1])
    {:noreply, results}
  end

  def handle_call(:find_duplicates, _from, state) do
    {:reply, hashes_with_more_than_one_path(state), state}
  end

  def hashes_with_more_than_one_path(results) do
    results
    |> Enum.filter(fn {_hash, paths} -> length(paths) > 1 end)
    |> Enum.map(&elem(&1, 1))
  end
end
