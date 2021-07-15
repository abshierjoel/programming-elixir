defmodule Sentencing do
  def capitalize_sentences(str) do
    capitalize_sentences(str |> to_charlist, [])
  end

  defp capitalize_sentences([?. | tail], cache) do
    mr_string =
      ["." | cache]
      |> Enum.reverse()
      |> to_string
      |> String.trim()
      |> String.capitalize()

    mr_string <> " " <> capitalize_sentences(tail)
  end

  defp capitalize_sentences([head | tail], cache) do
    capitalize_sentences(tail, [head | cache])
  end

  defp capitalize_sentences([], _cache), do: ""
end
