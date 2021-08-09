defmodule Racetrack.Cars do
  alias Racetrack.Cars.{Car, Track}
  alias Racetrack.Repo

  @surface_penalty %{
    snow: 35,
    gravel: 50,
    asphalt: 100
  }
  def get_car_with_track_speed(slug, name) do
    car = get_car(slug)

    if is_nil(car) do
      {nil, nil}
    else
      track = get_track(name)
      track_speed = apply_slowing_factors(car.max_speed, track)
      {car, track_speed}
    end
  end

  def get_car(slug) when is_binary(slug), do: Repo.get_by(Car, slug: slug)
  def get_track(nil), do: "track_not_selected"
  def get_track(name), do: Repo.get_by(Track, name: name) |> IO.inspect()

  def apply_slowing_factors(_speed, "track_not_selected"), do: "no track selected"
  def apply_slowing_factors(_speed, nil), do: "track not found"

  def apply_slowing_factors(speed, track) do
    speed
    |> apply_slowing_factor(:track_surface, track.surface)
    |> apply_slowing_factor(:time)
  end

  def apply_slowing_factor(speed, :time) do
    hour = Time.utc_now().hour
    if hour >= 9 and hour <= 18, do: speed, else: speed * 0.95
  end

  def apply_slowing_factor(speed, :track_surface, surface) do
    speed * (@surface_penalty[surface] / 100)
  end
end
