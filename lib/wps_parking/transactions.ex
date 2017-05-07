defmodule WpsParking.Transactions do

  alias WpsParking.{Client, Formatters.Transaction}

  def all(params \\ %{}) do
    params = params |> Map.put(:expand, "transactions")

    Client.get("transactions", params)
    |> Transaction.format
  end

  def show(id, params \\ %{}) do
    # params = params |> Map.put(:expand, "aids")

    Client.get("transactions/#{id}", params)
    |> Transaction.format
  end

  def create(params) do
    Client.post("transactions", params)
    |> Transaction.format_post_response
  end


end