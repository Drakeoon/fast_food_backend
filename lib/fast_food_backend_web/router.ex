defmodule FastFoodBackendWeb.Router do
  use FastFoodBackendWeb, :router

  pipeline :api do
    plug(JSONAPI.EnsureSpec)
    plug(JSONAPI.UnderscoreParameters)
  end

  scope "/api", FastFoodBackendWeb do
    pipe_through :api

    resources "/products", ProductController
  end
end
