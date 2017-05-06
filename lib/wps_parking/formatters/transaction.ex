defmodule WpsParking.Formatters.Transaction do

  alias WpsParking.Formatters.Base

  def format(payload) do
    payload
    |> Base.format("transactions")
  end

end