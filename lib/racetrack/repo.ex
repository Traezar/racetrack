defmodule Racetrack.Repo do
  use Ecto.Repo,
    otp_app: :racetrack,
    adapter: Ecto.Adapters.Postgres
end
