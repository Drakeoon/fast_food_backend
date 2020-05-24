defmodule FastFoodBackendWeb.Plug.Auth do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts) do
    [token] = get_req_header(conn, "authorization")
    stripped_token = String.replace(token, "Bearer ", "")

    case Token.verify_and_validate(stripped_token) do
      {:error, _} ->
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(401, ~s[{"message": "Unauthorized"}])
        |> halt()

      {:ok, _} ->
        conn
    end
  end
end
