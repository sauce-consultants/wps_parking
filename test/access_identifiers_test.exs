defmodule WpsParkingAccessIdentifiersTest do
  use ExUnit.Case

  test "returns all" do
    results = WpsParking.AccessIdentifiers.list("260fb99c-c441-4946-bab3-8cade05392a6")
    assert results |> Enum.count >= 1
  end

  test "returns one" do
    result = WpsParking.AccessIdentifiers.show("260fb99c-c441-4946-bab3-8cade05392a6", "c8712e72-6ef3-4abf-b47e-4c14e10bc13f")
    assert result[:a_id] == "c8712e72-6ef3-4abf-b47e-4c14e10bc13f"
    assert result[:customer_id] == "260fb99c-c441-4946-bab3-8cade05392a6"
  end

  @tag :skip
  test "creates one (adds to customer)" do
    post_body = %{
      "customerAid" => %{
        "type" => "BARCODE", # Or LICENSE_PLATE etc
        "value" => Random.rand(100000000000000000..99999999999999999999)
      },
      "aidState" => "ACTIVE"
    }

    result = WpsParking.AccessIdentifiers.create("260fb99c-c441-4946-bab3-8cade05392a6", post_body)
    assert result[:aid_id] != nil
  end
end
