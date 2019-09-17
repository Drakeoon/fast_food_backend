defmodule FastFoodBackend.Schema.ProductTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Socializer.Repo

  alias FastFoodBackendWeb.Resolvers

  object :product do
    field :id, :id
    field :name, :string
    field :price, :decimal
    field :quantity_limit, :integer
    field :description, :string
    field :photo_url, :string
    field :thumbnail_url, :string

    # TODO: many to many relationship
  end

  object :product_queries do
    field :products, list_of(:product) do
      resolve(&Resolvers.ProductResolver.list/3)
    end
  end

  object :product_mutations do
    field :create_product, :product do
      arg(:name, non_null(:string))
      arg(:price, non_null(:decimal))
      arg(:quantity_limit, non_null(:integer))
      arg(:description, non_null(:string))
      arg(:photo_url, non_null(:string))
      arg(:thumbnail_url, non_null(:string))

      resolve(&Resolvers.ProductResolver.create/3)
    end

    field :remove_product, :product do
      arg(:id, non_null(:string))

      resolve(&Resolvers.ProductResolver.remove/3)
    end
  end

  object :product_subscriptions do
    field :product_created, :product do
      config(fn _, _ ->
        {:ok, topic: "products"}
      end)

      trigger(:create_product,
        topic: fn _ ->
          "products"
        end
      )
    end
  end
end
