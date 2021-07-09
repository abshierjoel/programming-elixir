defmodule SalesTax do
  def get_total(orders, rates) do
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
