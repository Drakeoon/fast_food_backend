defmodule FastFoodBackend.Repo do
  use Ecto.Repo,
    otp_app: :fast_food_backend,
    adapter: Ecto.Adapters.Postgres
end
