defmodule WpsParking.Formatters.Customer do

  alias WpsParking.Formatters.Base

  def format(payload) do
    payload
    |> Base.format("customers")
  end

end