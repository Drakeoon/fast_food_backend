defmodule FastFoodBackendWeb.ProductView do
  use JSONAPI.View, type: "products"

  def fields do
    [
      :id,
      :description,
      :name,
      :photo_url,
      :price,
      :quantity_limit,
      :thumbnail_url
    ]
  end
end
