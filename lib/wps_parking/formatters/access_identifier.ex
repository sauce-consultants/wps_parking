defmodule WpsParking.Formatters.AccessIdentifier do

  alias WpsParking.Formatters.Base

  def format(payload) do
    payload
    |> Base.format("aids")
  end

  def format_post_response(payload) do
    payload
    |> Base.format_post_response("aids")
  end

end