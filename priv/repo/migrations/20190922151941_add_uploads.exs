defmodule FastFoodBackend.Repo.Migrations.AddUploads do
  use Ecto.Migration

  def change do
    create table(:uploads) do
      add :image_url, :string
      timestamps()
    end
  end
end
