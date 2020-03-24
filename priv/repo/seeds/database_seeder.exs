defmodule FastFoodBackend.DatabaseSeeder do
  alias FastFoodBackend.Repo
  alias FastFoodBackend.Products
  alias FastFoodBackend.Products.Product
  alias FastFoodBackend.Order

  def insert_product do
    name = get_unique_product_name()
    random_image_url = "https://loremflickr.com/360/360/#{name}"

    product = %Product{
      name: name,
      photo_url: random_image_url,
      thumbnail_url: random_image_url,
      description: Faker.Food.description(),
      price: Faker.random_between(9, 129) + 0.99,
      quantity_limit: Faker.random_between(10, 100),
      active: true
    }

    Repo.insert!(product)
  end

  defp get_unique_product_name do
    name = Faker.Food.dish()

    response = Products.find_product(name: name)

    case response do
      %Product{} -> get_unique_product_name
      nil -> name
    end
  end

  def clean_database do
    Repo.delete_all(Product)
    Repo.delete_all(Order)
  end
end
