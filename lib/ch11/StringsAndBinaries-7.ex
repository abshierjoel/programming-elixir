defmodule SalesTax do
  def get_taxes(tax_rates) do
    orders = get_orders()
    get_total(orders, tax_rates)
  end

  defp get_orders do
    file = File.open!("./lib/ch11/orders.not_csv")

    IO.stream(file, :line)
    |> Enum.map(&String.trim/1)
    |> remove_head()
    |> Enum.map(&string_to_record/1)
  end

  defp string_to_record(str) do
    [id_str, ship_to_str, net_amount_str] = str |> String.split(",")
    {id, _} = Integer.parse(id_str)
    {net_amount, _} = Float.parse(net_amount_str)
    ship_to = ship_to_str |> String.replace(":", "") |> String.to_atom()

    Keyword.new([
      {:id, id},
      {:ship_to, ship_to},
      {:net_amount, net_amount}
    ])
  end

  defp remove_head([_h | t]), do: t

  defp get_total(orders, rates) do
    for order <- orders do
      salesTax = get_tax_rate(rates, order[:ship_to])
      total = salesTax * order[:net_amount] + order[:net_amount]
      Keyword.put(order, :total_amount, total)
    end
  end

  defp get_tax_rate(rates, :NC), do: rates[:NC]
  defp get_tax_rate(rates, :NY), do: rates[:NY]
  defp get_tax_rate(_, _), do: 0
end
