defmodule AnagramLand do
  def anagram?(list_a, list_b), do: list_a |> Enum.sort() == list_b |> Enum.sort()
end
