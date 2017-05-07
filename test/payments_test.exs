defmodule WpsParkingPaymentsTest do
  use ExUnit.Case

  @tag :skip
  test "adds one to transaction" do
    post_body = %{
      "paymentResult" => "SUCCESS",
      "changeAmount" => %{
        "value" => "0.00",
        "currencyCode" => "GBP"
      },
      "clientId" => "Touchwood App",
      "subpayments" => [
        %{
          "paymentType" => "CASH",
          "paidAmount" => %{
            "value" => "0.00",
            "currencyCode" => "GBP"
          }
        }
      ]
    }

    result = WpsParking.Payments.add_to_transaction("414608eb-7d42-448f-996a-059a82063887", post_body)
    assert result[:payment_id] != nil
  end
end
  