defmodule Racetrack.Repo.Migrations.CreateTracks do
  use Ecto.Migration

  def change do
    create index(:cars, [:slug], unique: true)
    create index(:tracks, [:name], unique: true)
  end
end
