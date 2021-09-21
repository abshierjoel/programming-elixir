defmodule WeatherHistory do
  def for_location([], _target_loc), do: []

  def for_location([[time, target_loc, temp, rain] | tail], target_loc) do
    [[time, target_loc, temp, rain] | for_location(tail, target_loc)]
  end

  def for_location([_ | tail], target_loc), do: for_location(tail, target_loc)

  def test_data do
    [
      [1_366_225_622, 26, 15, 0.125],
      [1_366_225_622, 27, 15, 0.45],
      [1_366_225_622, 28, 21, 0.25],
      [1_366_225_622, 26, 19, 0.081],
      [1_366_225_622, 27, 17, 0.468],
      [1_366_225_622, 28, 15, 0.60],
      [1_366_225_622, 26, 22, 0.095],
      [1_366_225_622, 27, 21, 0.05],
      [1_366_225_622, 28, 24, 0.03],
      [1_366_225_622, 26, 17, 0.025]
    ]
  end
end
