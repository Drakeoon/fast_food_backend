defmodule FastFoodBackendWeb.Resolvers.ProductResolver do
  alias FastFoodBackend.Product

  def list(_parent, _args, _resolutions) do
    {:ok, Product.all()}
  end

  def show(_parent, args, _resolutions) do
    case Product.find(args[:id]) do
      nil -> {:error, "Not found"}
      post -> {:ok, post}
    end
  end

  def create(_parent, args, _resolutions) do
    Product.create(args)
  end

  def remove(_parent, args, _resolutions) do
    case Product.find(args[:id]) do
      nil -> {:error, "Not found"}
      post -> Product.remove(post.id)
    end
  end
end
