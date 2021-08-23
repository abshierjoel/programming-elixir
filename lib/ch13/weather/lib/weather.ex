defmodule Weather do
  import SweetXml
  alias WeatherData

  @weather_url "https://w1.weather.gov/xml/current_obs/KCOU.xml"

  def get_weather do
    {:ok, res} = HTTPoison.get(@weather_url)
    res.body |> parse_weather_data |> display_weather_data()
  end

  defp parse_weather_data(xml) do
    %WeatherData{
      location: xml |> xpath(~x"//location/text()") |> List.to_string(),
      weather: xml |> xpath(~x"//weather/text()") |> List.to_string(),
      humidity: xml |> xpath(~x"//relative_humidity/text()") |> List.to_string(),
      temp: xml |> xpath(~x"//temperature_string/text()") |> List.to_string(),
      wind: xml |> xpath(~x"//wind_string/text()") |> List.to_string()
    }
  end

  defp display_weather_data(data) do
    IO.puts("")
    IO.puts(data.location)
    IO.puts("=====================")
    IO.puts("#{data.weather} - #{data.temp} with #{data.humidity}% humidity.")
    IO.puts("")
    IO.puts("Winds are #{data.wind}.")
    IO.puts("")
  end
end
