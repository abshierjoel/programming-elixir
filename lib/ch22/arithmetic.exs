defmodule Arithmetic do
  defmacro explain(clauses) do
    clauses |> Keyword.get(:do, nil) |> do_math(nil)
  end

  defp do_math({op, _line, [l, r]}, nil) when is_integer(l) and is_integer(r), do: speak(op, l, r)

  defp do_math({op, _line, [l, r]}, res) when is_integer(l) and is_integer(r),
    do: res <> ", then " <> speak(op, l, r)

  defp do_math({op, _line, [l, r]}, res) when is_integer(l) and is_tuple(r),
    do: do_math(r, res) <> speak(op, l)

  defp do_math({op, _line, [l, r]}, res) when is_tuple(l) and is_integer(r),
    do: do_math(l, res) <> speak(op, r)

  defp do_math({op, _line, [l, r]}, res) when is_tuple(l) and is_tuple(r),
    do: do_math(r, do_math(l, res)) <> speak(op)

  defp speak(:+), do: " then sum the results"
  defp speak(:-), do: " then subtract from the first result"
  defp speak(:*), do: " then multiply the results"
  defp speak(:/), do: " then divide the first result by the second"

  defp speak(:+, v) when is_integer(v), do: " then add #{v}"
  defp speak(:-, v) when is_integer(v), do: " then subtract #{v}"
  defp speak(:*, v) when is_integer(v), do: " then multiply by #{v}"
  defp speak(:/, v) when is_integer(v), do: " then divide by #{v}"

  defp speak(:+, l, r) when is_integer(l) and is_integer(r), do: "add #{l} to #{r}"
  defp speak(:-, l, r) when is_integer(l) and is_integer(r), do: "subtract #{r} from #{l}"
  defp speak(:*, l, r) when is_integer(l) and is_integer(r), do: "multiply #{l} by #{r}"
  defp speak(:/, l, r) when is_integer(l) and is_integer(r), do: "divide #{l} by #{r}"
end
