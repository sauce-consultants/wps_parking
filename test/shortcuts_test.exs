defmodule WpsParkingShortcutsTest do
  use ExUnit.Case

  @tag :skip
  test "adds one to transaction" do
    post_body = %{
      "shortcutId" => "f393fa7b-ac7d-ebfd-5ede-8b28d62e3031"
    }

    result = WpsParking.Shortcuts.add_to_transaction("414608eb-7d42-448f-996a-059a82063887", post_body)
    IO.inspect result
    assert result[:transaction_id] != nil
  end
end
  