defmodule Times do
  defmacro times_n(n) do
    quote do
    end
  end

  defmacro myunless(condition, clauses) do
    do_clause = Keyword.get(clauses, :do, nil)
    else_clause = Keyword.get(clauses, :else, nil)

    quote do
      if unquote(condition) do
        unquote(else_clause)
      else
        unquote(do_clause)
      end
    end
  end
end

defmodule TimesTest do
  require Times

  def run do
    Times.times_n(4) |> IO.inspect(label: "4 Times")
    Times.times_n(5) |> IO.inspect(label: "5 Times")
  end
end

IO.puts TimesTest.
