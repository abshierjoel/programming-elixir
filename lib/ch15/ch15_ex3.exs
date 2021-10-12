defmodule WorkingWithMultipleProcesses3 do
  import :timer, only: [sleep: 1]

  def sad_function(parent) do
    send(parent, "TESTST1")
  end

  def run do
    spawn_link(WorkingWithMultipleProcesses3, :sad_function, [self])

    sleep(500)

    receive do
      msg -> IO.puts("MESSAGE RECEIVED: #{inspect(msg)}")
    after
      1000 ->
        IO.puts("Nothing happened as far as I am concerned")
    end
  end
end

WorkingWithMultipleProcesses3.run()
