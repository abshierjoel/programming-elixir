defmodule ControlFlows do
  def ok!(p) do
    case p do
      {:ok, data} -> data
      _ -> raise RuntimeError
    end
  end
end
