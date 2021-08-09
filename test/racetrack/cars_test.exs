defmodule Racetrack.CarsTest do
  use Racetrack.DataCase
  import Racetrack.CarFactory
  alias Racetrack.Cars.Car

  describe "get_car/1" do
    test "when valid slug is passed in , returns  %Car{}" do
      insert(:car, %{id: 1, slug: "raj_car", max_speed: 50})
      assert %Car{id: 1, slug: "raj_car"} = Racetrack.Cars.get_car("raj_car")
    end

    test "when invalid id or slug is passed in returns {:error, nil}" do
      assert nil == Racetrack.Cars.get_car("nonexistent_car")
    end
  end
end
