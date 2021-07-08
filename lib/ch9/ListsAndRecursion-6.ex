defmodule MyList do
  def flatten(list), do: flatten(list, [])

  def flatten([head | tail], acc) when is_list(head) do
    flatten(head, flatten(tail, acc))
  end

  def flatten([head | tail], acc) do
    [head | flatten(tail, acc)]
  end

  def flatten([], acc), do: acc
end
