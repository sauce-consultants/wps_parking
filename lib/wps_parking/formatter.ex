defmodule WpsParking.Formatter do

  def format(results, endpoint, associations \\ []) do
    atomized_endpoint = endpoint |> String.to_atom
    results 
    |> Map.get(atomized_endpoint)
  end

end