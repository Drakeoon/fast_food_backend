defmodule FastFoodBackendWeb.Router do
  use FastFoodBackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: FastFoodBackend.Schema

    forward "/", Absinthe.Plug, schema: FastFoodBackend.Schema
  end
end
