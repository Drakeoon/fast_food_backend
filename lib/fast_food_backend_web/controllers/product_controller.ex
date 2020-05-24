defmodule FastFoodBackendWeb.ProductController do
  use FastFoodBackendWeb, :controller
  
  alias FastFoodBackend.Products
  alias FastFoodBackend.Products.Product
  alias FastFoodBackendWeb.ProductView
  
  action_fallback FastFoodBackendWeb.FallbackController

  def index(conn, _params) do
    products = Products.list_products()
    conn
    |> put_view(ProductView)
    |> render("index.json", %{data: products})
  end

  def create(conn, %{"data" => %{"attributes" => product_params}}) do
    with {:ok, %Product{} = product} <- Products.create_product(product_params) do
      conn
      |> put_view(ProductView)
      |> put_status(:created)
      |> put_resp_header("location", Routes.product_path(conn, :show, product))
      |> render("show.json", %{data: product})
    end
  end

  def show(conn, %{"id" => id}) do
    product = Products.get_product!(id)
    conn
    |> put_view(ProductView)
    |> render("show.json", %{data: product})
  end

  def update(conn, %{"id" => id, "data" => %{"attributes" => product_params}}) do
    product = Products.get_product!(id)

    with {:ok, %Product{} = product} <- Products.update_product(product, product_params) do
      FastFoodBackendWeb.Endpoint.broadcast("product:update", "product_updated", %{"id" => id, "attributes" => product_params})
      
      conn
      |> put_view(ProductView)
      |> render("show.json", %{data: product})
    end
  end

  def delete(conn, %{"id" => id}) do
    product = Products.get_product!(id)

    with {:ok, %Product{}} <- Products.delete_product(product) do
      send_resp(conn, :no_content, "")
    end
  end
end
