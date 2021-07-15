defmodule Central do
  def centralize(strings) do
    w = strings |> Enum.max_by(&String.length/1) |> String.length()
    strings |> Enum.each(&pretty_print(&1, w))
  end

  def pretty_print(str, w) do
    len = (w - String.length(str)) |> div(2)
    spaces = String.duplicate(" ", len)
    IO.puts("#{spaces}#{str}")
  end
end
