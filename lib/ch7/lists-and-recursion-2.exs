defmodule MyList do
  def max([]), do: 0

  def max([head | tail]) do
    max(head, max(tail))
  end
end
