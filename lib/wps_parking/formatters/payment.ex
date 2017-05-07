defmodule WpsParking.Formatters.Payment do

  alias WpsParking.Formatters.Base

  def format(payload) do
    payload
    |> Base.format("payments")
  end

  def format_post_response(payload) do
    payload
    |> Base.format_post_response("payments")
  end

end