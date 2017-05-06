defmodule WpsParking.Formatters.Customer do

  alias WpsParking.Formatters.Base

  def format(payload) do
    payload
    |> Base.format("customers")
  end

  def format_post_response(payload) do
    payload
    |> Base.format_post_response("customers")
  end

end