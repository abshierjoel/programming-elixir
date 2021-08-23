defmodule Weather do
  @weather_url "https://w1.weather.gov/xml/current_obs/KCOU.xml"

  defstruct location: "Unknown", weather: "N/A", temp: 0, humidity: 0, wind: "N/A"

  def get_weather do
    {:ok, res} = HTTPoison.get(@weather_url)

    res.body
    |> to_charlist()
    |> parse_weather_data
  end

  defp parse_weather_data(xml) do
    :xmerl_xpath.string(xml, "temperature_string")
  end
end
