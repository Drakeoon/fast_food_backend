defmodule FastFoodBackend.Upload do
  use Ecto.Schema
  import Ecto.Changeset
  alias FastFoodBackend.Repo

  schema "uploads" do
    field :image_url, :string

    timestamps()
  end

  def all() do
    Repo.all(__MODULE__)
  end

  def changeset(struct, params \\ :invalid) do
    struct
    |> cast(params, [:image_url])
    |> validate_required([:image_url])
  end

  def create(changeset) do
    changeset
    |> Repo.insert!
  end
end
