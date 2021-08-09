defmodule Racetrack.Repo.Migrations.CreateCars do
  use Ecto.Migration

  def change do
    create table(:cars) do
      add :slug , :string
      add :max_speed , :integer
      timestamps()
    end
  end
end
