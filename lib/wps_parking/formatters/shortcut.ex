defmodule WpsParking.Formatters.Shortcut do

  alias WpsParking.Formatters.Base

  def format(payload) do
    payload
    |> Base.format("products")
  end

  def format_post_response(payload) do
    payload
    |> Base.format_post_response("products")
  end

end