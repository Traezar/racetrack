defmodule RacetrackWeb.CarControllerTest do
  use RacetrackWeb.ConnCase
  import Racetrack.CarFactory
  alias Racetrack.Cars

  describe "show" do
    test "show a car for the slug provided, without track" do
      insert(:car, %{id: 1, slug: "awesome_car", max_speed: 100})
      insert(:track, %{name: "awesome_track", surface: :snow})

      conn =
        build_conn()
        |> get("/api/v1/cars/awesome_car")

      {:ok, response} = JSON.decode(conn.resp_body)
      assert conn.status == 200
      car = response["data"]["car"]
      assert car["car_slug"] == "awesome_car"
      assert car["id"] == 1
      assert car["max_speed"] == "100km/h"
      assert car["max_speed_on_track"] == "no track selected"
    end

    test "show a car for the slug provided, with track" do
      insert(:car, %{id: 1, slug: "awesome_car", max_speed: 100})
      insert(:track, %{name: "awesome_track", surface: :snow})

      conn =
        build_conn()
        |> get("/api/v1/cars/awesome_car?track=awesome_track")

      {:ok, response} = JSON.decode(conn.resp_body)
      assert conn.status == 200
      car = response["data"]["car"]
      assert car["car_slug"] == "awesome_car"
      assert car["id"] == 1
      assert car["max_speed"] == "100km/h"

      assert car["max_speed_on_track"] ==
               100
               |> Cars.apply_slowing_factors(%{surface: :snow})
               |> RacetrackWeb.CarView.speed_in_km()
    end

    test "show a car for the slug provided, with unknown track" do
      insert(:car, %{id: 1, slug: "awesome_car", max_speed: 100})

      conn =
        build_conn()
        |> get("/api/v1/cars/awesome_car?track=unknown_track")

      {:ok, response} = JSON.decode(conn.resp_body)
      assert conn.status == 200
      car = response["data"]["car"]
      assert car["car_slug"] == "awesome_car"
      assert car["id"] == 1
      assert car["max_speed"] == "100km/h"
      assert car["max_speed_on_track"] == "track not found"
    end
  end
end
