defmodule Math do
  def calc(problem), do: calc(problem, 0)

  defp calc([?+ | tail], num), do: num + calc(tail, 0)
  defp calc([?- | tail], num), do: num - calc(tail, 0)
  defp calc([?* | tail], num), do: num * calc(tail, 0)
  defp calc([?/ | tail], num), do: num / calc(tail, 0)

  defp calc([head | tail], num) when head == ' ', do: calc(tail, num)
  defp calc([head | tail], num) when head in '0123456789', do: calc(tail, head - ?0 + num * 10)
  defp calc([], num), do: num
end
