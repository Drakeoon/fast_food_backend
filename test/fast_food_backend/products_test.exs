defmodule FastFoodBackend.ProductsTest do
  use FastFoodBackend.DataCase

  alias FastFoodBackend.Products

  describe "products" do
    alias FastFoodBackend.Products.Product

    @valid_attrs %{description: "some description", name: "some name", photo_url: "some photo_url", price: "120.5", quantity_limit: 42, thumbnail_url: "some thumbnail_url"}
    @update_attrs %{description: "some updated description", name: "some updated name", photo_url: "some updated photo_url", price: "456.7", quantity_limit: 43, thumbnail_url: "some updated thumbnail_url"}
    @invalid_attrs %{description: nil, name: nil, photo_url: nil, price: nil, quantity_limit: nil, thumbnail_url: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Products.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Products.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Products.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Products.create_product(@valid_attrs)
      assert product.description == "some description"
      assert product.name == "some name"
      assert product.photo_url == "some photo_url"
      assert product.price == Decimal.new("120.5")
      assert product.quantity_limit == 42
      assert product.thumbnail_url == "some thumbnail_url"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, %Product{} = product} = Products.update_product(product, @update_attrs)
      assert product.description == "some updated description"
      assert product.name == "some updated name"
      assert product.photo_url == "some updated photo_url"
      assert product.price == Decimal.new("456.7")
      assert product.quantity_limit == 43
      assert product.thumbnail_url == "some updated thumbnail_url"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_product(product, @invalid_attrs)
      assert product == Products.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Products.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Products.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Products.change_product(product)
    end
  end
end
