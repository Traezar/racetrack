defmodule Racetrack.CarsTest do
  use Racetrack.DataCase
  alias Racetrack.Cars.Car

  describe "get_car/1" do
    test "when valid slug is passed in , returns {:ok, %Car{}}" do
      insert(:car,%{id: 1 , slug: "raj_car", max_speed: 50})
      assert {:ok, %Car{id: 1, slug: "raj_car"}} = Racetrack.Cars.get_car("raj_car")
    end

    test "when valid id is passed in , returns {:ok, car}" do
    end

    test "when invalid id or slug is passed in returns {:error, nil}" do
    end
  end

end
