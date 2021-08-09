defmodule Racetrack.Cars.Track do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tracks" do
    field :name, :string
    field :surface, Ecto.Enum, values: [:snow, :gravel, :asphalt]
    timestamps()
  end

  @doc false
  def changeset(track, attrs) do
    track
    |> cast(attrs, [:name,:surface])
  end
end
