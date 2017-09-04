defmodule WpsParking.Client do
  @moduledoc """
  An HTTP client for WpsParking.
  """

  # Build the client on top of HTTPoison
  use Application
  use HTTPoison.Base

  def start(_type, _args) do
    WpsParking.Supervisor.start_link
  end

  @doc """
  Creates the URL for our endpoint.
  """
  def process_url(endpoint) do
    "#{root_api_url()}#{endpoint}" 
  end

  @doc """
  Decodes the response to JSON and converts the binary keys in our response to atoms.
  """
  def process_response_body(body) do
    JSX.decode!(body, [{:labels, :atom}])
  end

  @doc """
  Boilerplate code to make requests.
  """
  def get(endpoint, params \\ %{}) do
    params = params |> Map.put("carparkId", Application.get_env(:wps_parking, :carpark_id))
    WpsParking.Client.get!(
      endpoint,
      headers(),
      [timeout: 30000, recv_timeout: 30000, params: params]
    ).body
  end
  
  def put(endpoint, params \\ %{}) do
    params = params |> Map.put("carparkId", Application.get_env(:wps_parking, :carpark_id))
    WpsParking.Client.put!(
      endpoint,
      headers(),
      params: params
    ).body
  end

  def post(endpoint, body, params \\ %{}) do
    params = params |> Map.put("carparkId", Application.get_env(:wps_parking, :carpark_id))
    WpsParking.Client.post!(
      endpoint,
      JSX.encode!(body),
      headers(),
      params: params
    ).body
  end


  @doc """
  Default json headers
  """
  def headers do
    %{
      "Content-Type" => "application/json",
      # "Accept" => "application/json",
      "Authorization" => auth_header()
    }
  end

  defp auth_header do
    encoded = Base.encode64("#{Application.get_env(:wps_parking, :username)}:#{Application.get_env(:wps_parking, :password)}")
    "Basic #{encoded}"
  end

  def root_api_url do
   Application.get_env(:wps_parking, :root_api_url) ||
     System.get_env("WPS_PARKING_ROOT_API_URL")
  end

end
