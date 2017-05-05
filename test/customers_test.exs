defmodule WpsParkingCustomersTest do
  use ExUnit.Case

  test "returns all" do
    results = WpsParking.Customers.all
    assert results |> Enum.count == 20
  end

  test "returns one" do
    result = WpsParking.Customers.show("260fb99c-c441-4946-bab3-8cade05392a6")
    assert result[:customer_id] == "260fb99c-c441-4946-bab3-8cade05392a6"
  end
end
