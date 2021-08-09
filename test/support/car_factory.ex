defmodule Racetrack.CarFactory do
  use ExMachina.Ecto, repo: Racetrack.Repo
  alias Racetrack.Cars.{Car, Track}

  def car_factory(attrs) do
    %Car{id: attrs.id, slug: attrs.slug, max_speed: attrs.max_speed}
  end

  def track_factory(attrs), do: %Track{name: attrs.name, surface: attrs.surface}
end
