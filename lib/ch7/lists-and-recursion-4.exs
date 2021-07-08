defmodule MyList do
  def span(current, to) when current == to, do: [current]

  def span(current, to) when current < to do
    [current | span(current + 1, to)]
  end
end
