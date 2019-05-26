defmodule FastFoodBackendWeb.PageController do
  use FastFoodBackendWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
