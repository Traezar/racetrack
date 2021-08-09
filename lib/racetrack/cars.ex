defmodule Racetrack.Cars do
  alias Racetrack.Cars.{Car, Track}
  alias Racetrack.Repo

  def get_car(slug) when is_binary(slug), do: Repo.get_by(Car, slug: slug)
  def get_track(nil), do: "track not selected"
  def get_track(name), do: Repo.get_by(Track, name: name)
end
