defmodule WpsParkingTransactionsTest do
  use ExUnit.Case

  test "returns all" do
    results = WpsParking.Transactions.all
    assert results |> Enum.count == 20
  end

  test "filters by aid type" do
    results = WpsParking.Transactions.all(%{customerAidType: "BARCODE", customerAidValue: "98760812495096856576"})
    assert results |> Enum.count == 1
  end


  test "returns one" do
    result = WpsParking.Transactions.show("98bd9ec8-afae-4566-aa10-1de6e13efb80")
    assert result[:transaction_id] == "98bd9ec8-afae-4566-aa10-1de6e13efb80"
  end

  @tag :skip
  test "creates one" do
    post_body = %{
      "autofillProductsAndReductions" => true,
      "customerAid" => %{
        "type" => "BARCODE",
        "value" => "98760812495096856576"
      }
    }

    result = WpsParking.Transactions.create(post_body)
    assert result[:transaction_id] != nil
  end
end
  