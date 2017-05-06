defmodule WpsParking.Formatters.Base do

  def format(results, endpoint, associations \\ []) do
    atomized_endpoint = endpoint |> String.to_atom

    results 
    |> maybe_remove_root_node(atomized_endpoint)
    |> deep_format_keys
    |> clean_associations
  end

  def format_post_response(result, endpoint) do
    singular_endpoint = endpoint |> Inflex.singularize 
    url_key = singular_endpoint <> "Url" |> String.to_atom
    id_key = singular_endpoint <> "_id" |> String.to_atom

    result_id = result[url_key] |> clean_association

    %{} |> Map.put(id_key, result_id)
  end

  def maybe_remove_root_node(results, atomized_endpoint) do
    case results |> Map.get(atomized_endpoint) do
      nil -> results
      child_nodes -> child_nodes
    end
  end

  def deep_format_keys(list) when is_list(list) do
    list
    |> Enum.map(fn(item) -> 
      deep_format_keys(item)
    end)
  end
  def deep_format_keys(map) when is_map(map) do
    Enum.reduce(map, %{}, &deep_format_key_value/2)
  end
  def deep_format_keys(other) do
    other
  end

  defp deep_format_key_value({key, value}, accumulator) when is_map(value) do
    Map.put(accumulator, format_key(key), deep_format_keys(value))
  end
  defp deep_format_key_value({key, value}, accumulator) do
    Map.put(accumulator, format_key(key), value)
  end

  def format_key(k) when is_atom(k), do: k |> Atom.to_string |> format_key
  def format_key(key), do: key |> Macro.underscore |> String.to_atom

  def clean_associations(list) when is_list(list) do
    list 
    |> Enum.map(fn(item) -> 
      clean_associations(item)
    end)
  end
  def clean_associations(map) when is_map(map) do
    Enum.reduce(map, %{}, &clean_associations/2)
  end
  def clean_associations({key, value}, accumulator) when is_list(value) do
    cleaned_value =
      value
      |> Enum.map(&clean_association/1)

    accumulator |> Map.put(key, cleaned_value)
  end
  def clean_associations({key, value}, accumulator) do
    accumulator |> Map.put(key, value)
  end
  def clean_associations(item, acc), do: acc

  def clean_association(string) when is_binary(string) do
    string
    |> String.replace(Application.get_env(:wps_parking, :root_api_url), "")
    |> String.split("?carparkId")
    |> List.first
    |> String.split("/")
    |> List.last
  end
  def clean_association(map) when is_map(map) do
    deep_format_keys(map)
  end
  def clean_association(other), do: other


end