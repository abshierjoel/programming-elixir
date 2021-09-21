defmodule StringsAndBinaries3 do
  # This returns ['cat', 100, 111, 103]
  def example do
    ['cat', 'dog']
  end

  # This is because the head of the list is taken as one piece and
  # elixir sees that it can print those characters, whereas
  # the tail is taken as individual pieces
end
