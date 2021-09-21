defmodule MyList do
  # Return true if all elements meet a condition
  def all?([head | tail], condition), do: condition.(head) && all?(tail, condition)
  def all?([], _), do: true

  # Return a list of results from a function applied to each element of another list
  def each([head | tail], func), do: [func.(head) | each(tail, func)]
  def each([], _), do: []

  # Return a list of filter values from another
  def filter([head | tail], condition) do
    if condition.(head) do
      [head | filter(tail, condition)]
    else
      [filter(tail, condition)]
    end
  end

  def filter([], _), do: []

  # Split a list into a tuple
  def split(list, at) when at >= 0, do: split(list, at, [])

  def split(list, at) when at < 0, do: split(list, at + length(list), [])

  def split([head | tail], at, acc) when length(acc) < at do
    split(tail, at, acc ++ [head])
  end

  def split(list, _, acc), do: {acc, list}

  # Return a list with the first X amount of items from another
  def take(list, count) when count >= 0, do: take(list, count, [])

  def take([head | tail], count, acc) when length(acc) < count do
    take(tail, count, acc ++ [head])
  end

  def take(_, _, acc), do: acc
end
