defmodule FastFoodBackend.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias FastFoodBackend.Order

  schema "products" do
    field :description, :string
    field :name, :string
    field :photo_url, :string
    field :price, :decimal
    field :quantity_limit, :integer
    field :thumbnail_url, :string
    field :active, :boolean

    timestamps()

    many_to_many :orders, Order, join_through: "order_products"
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :price, :quantity_limit, :description, :photo_url, :thumbnail_url, :active])
    |> validate_required([:name, :price, :quantity_limit, :description, :photo_url, :thumbnail_url, :active])
    |> unique_constraint(:name)
  end
end
