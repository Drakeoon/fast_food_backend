defmodule FastFoodBackend.Product do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias FastFoodBackend.{Repo, Order}

  schema "products" do
    field :name, :string
    field :price, :decimal
    field :quantity_limit, :integer
    field :description, :string
    field :photoUrl, :string
    field :thumbnailUrl, :string

    many_to_many :orders, Order, join_through: "order_products"
  end

  def all do
    Repo.all(from p in __MODULE__, order_by: [desc: p.name])
  end

  def find(id) do
    Repo.get(__MODULE__, id)
  end

  def create(attrs) do
    attrs
    |> changeset()
    |> Repo.insert()
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> changeset(attrs)
  end

  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :price, :quantity_limit, :description, :photoUrl, :thumbnailUrl])
    |> validate_required([:name, :price, :quantity_limit, :description, :photoUrl, :thumbnailUrl])
  end
end
