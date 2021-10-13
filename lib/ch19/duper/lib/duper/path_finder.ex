defmodule Duper.PathFinder do
  use GenServer

  def start_link(root), do: GenServer.start_link(__MODULE__, root, name: __MODULE__)
  def next_path, do: GenServer.call(__MODULE__, :next_path)

  def init(path), do: DirWalker.start_link(path)

  def handle_call(:next_path, _from, dir_walker) do
    path =
      case DirWalker.next(dir_walker) do
        [path] -> path
        other -> other
      end

    {:reply, path, dir_walker}
  end
end
