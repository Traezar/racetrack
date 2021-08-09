defmodule RacetrackWeb.CarView do
  use RacetrackWeb, :view

  def render("car_summary.json", %{car: car}) do
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
end
