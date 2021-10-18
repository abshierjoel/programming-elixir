defmodule Times do
  defmacro times_n(n) do
    fun = String.to_atom("times_#{n}")

    quote do
      def unquote(fun)(x) do
        x * unquote(n)
      end
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

  Times.times_n(4)
  Times.times_n(5)
end
