defmodule Ticker do
  @interval 2000
  @name :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[], nil])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send(:global.whereis_name(@name), {:register, client_pid})
  end

  def generator(clients, current) do
    receive do
      {:register, pid} ->
        IO.puts("registering #{inspect(pid)}")

        if current == nil do
          generator([pid | clients], 0)
        else
          generator([pid | clients], current)
        end
    after
      @interval ->
        IO.puts("tick")

        if current != nil do
          Enum.at(clients, current) |> send({:tick})
          new_current = next_client(clients, current)
          generator(clients, new_current)
        else
          generator(clients, current)
        end
    end
  end

  defp next_client(clients, current) when current < length(clients), do: current + 1
  defp next_client(_clients, current), do: current
end

defmodule Client do
  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Ticker.register(pid)
  end

  def receiver do
    receive do
      {:tick} ->
        IO.puts("tock in client")
        receiver()
    end
  end
end
