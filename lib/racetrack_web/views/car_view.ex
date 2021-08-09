defmodule RacetrackWeb.CarView do
  use RacetrackWeb, :view

  def render("car_summary.json", %{car: car, track_speed: track_speed}) do
    %{
      data: %{
        car: %{
          id: car.id,
          car_slug: car.slug,
          max_speed: speed_in_km(car.max_speed),
          max_speed_on_track: speed_in_km(track_speed)
        }
      }
    }
  end

  def speed_in_km(speed) when is_integer(speed), do: Integer.to_string(speed) <> "km/h"
  def speed_in_km(speed) when is_float(speed), do: Float.to_string(speed) <> "km/h"
  def speed_in_km(speed) when is_binary(speed), do: speed
end
