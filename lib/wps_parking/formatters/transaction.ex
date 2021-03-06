defmodule WpsParking.Formatters.Transaction do

  alias WpsParking.Formatters.Base

  def format(payload) do
    payload
    |> Base.format("transactions")
  end

  def format_post_response(payload) do
    payload
    |> Base.format_post_response("transactions")
  end

end