defmodule FastFoodBackend.Repo.Migrations.CreateOrderProducts do
  use Ecto.Migration

  def change do
    create table(:order_products) do
      add :order_id, references(:orders, on_delete: :nothing)
      add :product_id, references(:products, on_delete: :nothing)
    end

    create index(:order_products, [:order_id])
    create index(:order_products, [:product_id])
    create unique_index(:order_products, [:order_id, :product_id])
  end
end
