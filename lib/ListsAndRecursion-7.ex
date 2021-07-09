defmodule MyList do
  def span(current, to) when current == to, do: [current]

  def span(current, to) when current < to do
    [current | span(current + 1, to)]
  end

  def get_primes(n) do
    for i <- span(2, n), is_prime(i), do: i
  end

  def is_prime(2), do: true

  def is_prime(i),
    do: Enum.all?(for j <- span(2, i - 1), i > j, do: rem(i, j) != 0)
end
