defmodule FastFoodBackend.Order do
  use Ecto.Schema

  alias FastFoodBackend.{Repo, Product}

  schema "orders" do
    field :user_id, :id

    many_to_many :products, Product, join_through: "order_products"
  end

  def all do
    Repo.all()
  end

  def find(id) do
    Repo.get(__MODULE__, id)
  end

  def create(attrs) do
    attrs
    |> Repo.insert()
  end
end
