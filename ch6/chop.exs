defmodule Chop do
  def guess(actual, %Range{} = range) when is_integer(actual) do
    middle = range |> get_middle
    try_guess(actual, range, middle)
  end

  defp try_guess(actual, range, guess) when guess == actual do
    IO.puts("Found it: #{guess}")
    guess
  end

  defp try_guess(actual, range, guess) when guess < actual do
    new_range = (guess + 1)..range.last
    middle = new_range |> get_middle
    try_guess(actual, new_range, middle)
  end

  defp try_guess(actual, range, guess) when guess > actual do
    new_range = range.first..(guess - 1)
    middle = new_range |> get_middle
    try_guess(actual, new_range, middle)
  end

  defp get_middle(range) do
    diff = range.last - range.first
    IO.puts("Is it #{div(diff, 2) + range.first}?")
    div(diff, 2) + range.first
  end
end
