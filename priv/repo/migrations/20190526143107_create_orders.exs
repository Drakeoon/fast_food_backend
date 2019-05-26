defmodule FastFoodBackend.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
  end
end
