defmodule FastFoodBackendWeb.ProductView do
  use FastFoodBackendWeb, :view
  alias FastFoodBackendWeb.ProductView

  def render("index.json", %{products: products}) do
    %{data: render_many(products, ProductView, "product.json")}
  end

  def render("show.json", %{product: product}) do
    %{data: render_one(product, ProductView, "product.json")}
  end

  def render("product.json", %{product: product}) do
    %{
      id: product.id,
      name: product.name,
      price: product.price,
      quantity_limit: product.quantity_limit,
      description: product.description,
      photo_url: product.photo_url,
      thumbnail_url: product.thumbnail_url
    }
  end
end
