defmodule Racetrack.CarFactory do
    use ExMachina.Ecto, repo: Racetrack.Repo
    alias Racetrack.Cars.Car

    def car_factory(attrs) do
      %Car{
        id: attrs.id,
        slug: attrs.slug,
        max_speed: attrs.max_speed
      }
    end
end
