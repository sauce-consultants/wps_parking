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

  test "creates one" do
    post_body = %{
      "customerState" => "ACTIVE",
      "customerFirstName" => "Matt",
      "customerLastName" => "Weldon",
      "customerEmail" => "matt.weldon@wearesauce.io",
      "customerValidityType" => "UNLIMITED",
      "customerTypeId" => "bfd41f61-534a-4467-a410-aeb4e1a17e2d",
      "customerValueType" => "NO_VALUE"
    }

    result = WpsParking.Customers.create(post_body)
    assert result[:customer_id] != nil
  end

end
