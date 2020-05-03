defmodule FastFoodBackendWeb.ProductChannel do
    use Phoenix.Channel

    def join("product:update", _message, socket) do
        {:ok, socket}
    end
end