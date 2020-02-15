defmodule FastFoodBackendWeb.ProductControllerTest do
  use FastFoodBackendWeb.ConnCase

  alias FastFoodBackend.Products
  alias FastFoodBackend.Products.Product

  @create_attrs %{
    description: "some description",
    name: "some name",
    photo_url: "some photo_url",
    price: "120.5",
    quantity_limit: 42,
    thumbnail_url: "some thumbnail_url"
  }
  @update_attrs %{
    description: "some updated description",
    name: "some updated name",
    photo_url: "some updated photo_url",
    price: "456.7",
    quantity_limit: 43,
    thumbnail_url: "some updated thumbnail_url"
  }
  @invalid_attrs %{description: nil, name: nil, photo_url: nil, price: nil, quantity_limit: nil, thumbnail_url: nil}

  def fixture(:product) do
    {:ok, product} = Products.create_product(@create_attrs)
    product
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all products", %{conn: conn} do
      conn = get(conn, Routes.product_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create product" do
    test "renders product when data is valid", %{conn: conn} do
      conn = post(conn, Routes.product_path(conn, :create), product: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.product_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "name" => "some name",
               "photo_url" => "some photo_url",
               "price" => "120.5",
               "quantity_limit" => 42,
               "thumbnail_url" => "some thumbnail_url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.product_path(conn, :create), product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update product" do
    setup [:create_product]

    test "renders product when data is valid", %{conn: conn, product: %Product{id: id} = product} do
      conn = put(conn, Routes.product_path(conn, :update, product), product: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.product_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "name" => "some updated name",
               "photo_url" => "some updated photo_url",
               "price" => "456.7",
               "quantity_limit" => 43,
               "thumbnail_url" => "some updated thumbnail_url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, product: product} do
      conn = put(conn, Routes.product_path(conn, :update, product), product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete product" do
    setup [:create_product]

    test "deletes chosen product", %{conn: conn, product: product} do
      conn = delete(conn, Routes.product_path(conn, :delete, product))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.product_path(conn, :show, product))
      end
    end
  end

  defp create_product(_) do
    product = fixture(:product)
    {:ok, product: product}
  end
end
