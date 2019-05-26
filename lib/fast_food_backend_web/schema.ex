defmodule FastFoodBackend.Schema do
  use Absinthe.Schema
  import_types(Absinthe.Type.Custom)

  import_types(FastFoodBackend.Schema.ProductTypes)

  query do
    import_fields(:product_queries)
  end

  mutation do
    import_fields(:product_mutations)
  end

  subscription do
    import_fields(:product_subscriptions)
  end
end
