defmodule FastFoodBackend.Resolvers.OrderResolver do
  alias FastFoodBackend.{Order, Product}

  def create(name, args) do
    Order.create(%{name: name})
    |> create(args)
  end

  def create(%Order{}, args) do
    args
  end
end
