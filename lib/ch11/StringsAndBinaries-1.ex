defmodule StringZone do
  def can_print?(str), do: is_ascii(str)

  defp is_ascii([]), do: true
  defp is_ascii([head | tail]) when head > 32 and head < 127, do: is_ascii(tail)
  defp is_ascii([_head | _tail]), do: false
end
