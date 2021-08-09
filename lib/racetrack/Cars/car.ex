defmodule Racetrack.Cars.Car do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cars" do
    field :slug, :string
    field :max_speed, :integer
    timestamps()
  end

  @doc false
  def changeset(car, attrs) do
    car
    |> cast(attrs, [:slug, :max_speed])
    |> validate_required([:slug, :max_speed])
  end
end
