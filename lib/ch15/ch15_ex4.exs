defmodule WorkingWithMultipleProcesses4 do
  import :timer, only: [sleep: 1]

  def sad_function(parent) do
    raise ArgumentError, "Test Failure"
  end

  def run do
    spawn_link(WorkingWithMultipleProcesses4, :sad_function, [self])

    sleep(500)

    receive do
      msg -> IO.puts("MESSAGE RECEIVED: #{inspect(msg)}")
    after
      1000 ->
        IO.puts("Nothing happened as far as I am concerned")
    end
  end
end

WorkingWithMultipleProcesses4.run()
