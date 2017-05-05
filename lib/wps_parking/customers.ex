defmodule WpsParking.Customers do

  alias WpsParking.{Client, Formatters.Customer}

  def all(params \\ %{}) do
    params = params |> Map.put(:expand, "customers")

    Client.get("customers", params)
    |> Customer.format
  end

  def show(id, params \\ %{}) do
    params = params |> Map.put(:expand, "aids")

    Client.get("customers/#{id}", params)
    |> Customer.format
  end

end