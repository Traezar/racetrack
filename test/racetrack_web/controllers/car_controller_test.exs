defmodule RacetrackWeb.CarControllerTest do
  use RacetrackWeb.ConnCase
  import Racetrack.CarFactory

  describe "show" do
    test "show a car for the slug" do
      insert(:car, %{id: 1, slug: "awesome_car", max_speed: 100})

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
  end
end
