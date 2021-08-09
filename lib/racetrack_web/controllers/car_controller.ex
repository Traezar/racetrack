defmodule RacetrackWeb.CarController do
  use RacetrackWeb, :controller
  alias Racetrack.Cars

  def show(conn, params) do
    slug = String.downcase(params["id"])
    track = params["track"]
    {car, track_speed} = Cars.get_car_with_track_speed(slug, track)

    if is_nil(car),
      do: render_404(conn),
      else: render(conn, "car_summary.json", car: car, track_speed: track_speed)
  end

  defp render_404(conn) do
    conn
    |> put_status(:not_found)
    |> put_view(RacetrackWeb.ErrorView)
    |> render(:not_found)
  end
end
