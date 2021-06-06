defmodule Times do
  def double(n), do: n * 2
  def quadruple(n), do: n |> double |> double
  def quintuple(n), do: n |> double |> double |> double
end
