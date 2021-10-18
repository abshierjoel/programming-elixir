defmodule Scope do
  defmacro update_local(val) do
    local = "some value"

    result =
      quote do
        local = unquote(val)
        IO.puts("End of macro bbody, local = #{local}")
      end

    IO.puts("In macro definition, local=#{local}")
    result
  end
end

defmodule Test do
  require Scope

  local = 123
  Scope.update_local("cat")
  IO.puts("On return, local = #{local}")
end
