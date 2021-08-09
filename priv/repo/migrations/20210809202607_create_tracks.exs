defmodule Racetrack.Repo.Migrations.CreateTracks do
  use Ecto.Migration

  def change do
    create table(:tracks) do
      add :name, :string
      add :surface, :string
      timestamps()
    end

  end
end
