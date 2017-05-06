defmodule WpsParkingTransactionsTest do
  use ExUnit.Case

  test "returns all" do
    results = WpsParking.Transactions.all
    assert results |> Enum.count == 20
  end

  test "returns one" do
    result = WpsParking.Transactions.show("98bd9ec8-afae-4566-aa10-1de6e13efb80")
    assert result[:transaction_id] == "98bd9ec8-afae-4566-aa10-1de6e13efb80"
  end
end
  