use Mix.Config

config :wps_parking,
  root_api_url: System.get_env("WPS_PARKING_ROOT_API_URL"),
  carpark_id: System.get_env("WPS_PARKING_CARPARK_ID"),
  username: System.get_env("WPS_PARKING_USERNAME"),
  password: System.get_env("WPS_PARKING_PASSWORD")
