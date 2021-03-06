defmodule MyUnless do
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

defmodule UnlessTest do
  require MyUnless

  def run do
    MyUnless.myunless 2 == 2 do
      IO.puts("1 is not equal to 2")
    else
      IO.puts("1 is equal to 2")
    end
  end
end
