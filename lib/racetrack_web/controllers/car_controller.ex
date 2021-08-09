defmodule RacetrackWeb.CarController do
  use RacetrackWeb, :controller
  alias Racetrack.Cars

  def show(conn, params) do
    car = Cars.get_car(params["id"])

    if is_nil(car),
      do: render_404(conn),
      else: render(conn, "car_summary.json", car: car)
  end

  defp render_404(conn) do
    conn
    |> put_status(:not_found)
    |> put_view(Racetrack.ErrorView)
    |> render(:"404")
  end
end
