defmodule FastFoodBackend.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :price, :decimal, precision: 6, scale: 2
      add :quantity_limit, :integer, default: 99
      add :description, :text
      add :photo_url, :string
      add :thumbnail_url, :string

      timestamps()
    end

    create unique_index(:products, [:name])
  end
end
