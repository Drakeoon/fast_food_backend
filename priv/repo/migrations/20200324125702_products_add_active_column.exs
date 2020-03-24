defmodule FastFoodBackend.Repo.Migrations.ProductsAddActiveColumn do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :active, :boolean, default: true
    end
  end
end
