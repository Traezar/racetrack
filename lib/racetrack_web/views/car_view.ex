defmodule RacetrackWeb.CarView do
  use RacetrackWeb, :view

  @surface_penalty %{
    snow: 35,
    gravel: 50,
    asphalt: 100
  }

  def render("car_summary.json", %{car: car, track: "track_not_selected"}) do
    %{
      data: %{
        car: %{
          id: car.id,
          car_slug: car.slug,
          max_speed: Integer.to_string(car.max_speed) <> "km/h",
          max_speed_on_track: "no track selected"
        }
      }
    }
  end

  def render("car_summary.json", %{car: car, track: nil}) do
    %{
      data: %{
        car: %{
          id: car.id,
          car_slug: car.slug,
          max_speed: Integer.to_string(car.max_speed) <> "km/h",
          max_speed_on_track: "track not found"
        }
      }
    }
  end

  def render("car_summary.json", %{car: car, track: track}) do
    %{
      data: %{
        car: %{
          id: car.id,
          car_slug: car.slug,
          max_speed: track_speed_in_km(car.max_speed),
          max_speed_on_track: max_speed_on_track(car.max_speed, track) |> track_speed_in_km
        }
      }
    }
  end

  def max_speed_on_track(speed, track) do
    speed * (@surface_penalty[track.surface] / 100)
  end

  def track_speed_in_km(speed) when is_integer(speed), do: Integer.to_string(speed) <> "km/h"
  def track_speed_in_km(speed) when is_float(speed), do: Float.to_string(speed) <> "km/h"
end
