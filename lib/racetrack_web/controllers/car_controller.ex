defmodule RacetrackWeb.CarController do
  use RacetrackWeb, :controller
  alias Racetrack.Cars

  def show(conn, params) do
    {car, track_speed} = Cars.get_car_with_track_speed(params["id"], params["track"])

    if is_nil(car),
      do: render_404(conn),
      else: render(conn, "car_summary.json", car: car, track_speed: track_speed)
  end

  defp render_404(conn) do
    conn
    |> put_status(:not_found)
    |> put_view(Racetrack.ErrorView)
    |> render(:"404")
  end
end
