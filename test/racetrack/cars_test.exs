defmodule Racetrack.CarsTest do
  use Racetrack.DataCase
  import Racetrack.CarFactory
  alias Racetrack.Cars.{Car, Track}

  describe "get_car/1" do
    test "when valid slug is passed in , returns  %Car{}" do
      insert(:car, %{id: 1, slug: "raj_car", max_speed: 50})
      assert %Car{id: 1, slug: "raj_car"} = Racetrack.Cars.get_car("raj_car")
    end

    test "when invalid id or slug is passed in returns {:error, nil}" do
      assert nil == Racetrack.Cars.get_car("nonexistent_car")
    end
  end

  describe "get_track/1" do
    test "when valid name is passed in , returns  %Track{}" do
      insert(:track, %{name: "track_one", surface: :snow})
      insert(:track, %{name: "track_two", surface: :asphalt})
      insert(:track, %{name: "track_three", surface: :gravel})
      assert %Track{name: "track_one", surface: :snow} = Racetrack.Cars.get_track("track_one")
      assert %Track{name: "track_two", surface: :asphalt} = Racetrack.Cars.get_track("track_two")

      assert %Track{name: "track_three", surface: :gravel} =
               Racetrack.Cars.get_track("track_three")
    end

    test "when invalid name is passed in , returns  `track not selected`" do
      assert nil == Racetrack.Cars.get_track("non existent track")
    end

    test "when nil is passed in , returns  `track not selected`" do
      assert "track not selected" == Racetrack.Cars.get_track(nil)
    end
  end
end
