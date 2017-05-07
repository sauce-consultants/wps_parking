defmodule WpsParking.Shortcuts do

  alias WpsParking.{Client, Formatters.Shortcut}

  def add_to_transaction(transaction_id, params) do
    Client.post("transactions/#{transaction_id}/products/shortcut", params)
    |> Shortcut.format_post_response
  end

end