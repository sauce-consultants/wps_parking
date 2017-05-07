defmodule WpsParking.AccessIdentifiers do

  alias WpsParking.{Client, Formatters.AccessIdentifier}

  def list(customer_id) do
    customer = WpsParking.Customers.show(customer_id)

    customer[:aids]
  end

  def show(customer_id, a_id) do
    Client.get("customers/#{customer_id}/aids/#{a_id}")
    |> AccessIdentifier.format
  end

  def create(customer_id, params) do
    Client.post("customers/#{customer_id}/aids", params)
    |> AccessIdentifier.format_post_response
  end

end