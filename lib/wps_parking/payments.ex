defmodule WpsParking.Payments do

  alias WpsParking.{Client, Formatters.Payment}

  def add_to_transaction(transaction_id, params) do
    IO.inspect Client.post("transactions/#{transaction_id}/payments", params)
    #|> Payment.format_post_response
  end

end