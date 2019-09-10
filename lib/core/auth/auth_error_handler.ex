defmodule Core.AuthErrorHandler do
  @moduledoc false

  use Phoenix.Controller
  # import Plug.Conn

  @behaviour Guardian.Plug.ErrorHandler

  @impl Guardian.Plug.ErrorHandler
  def auth_error(conn, {_type, _reason}, _opts) do
    conn
    |> put_status(401)
    |> put_view(CoreWeb.ErrorView)
    |> render("unauthenticated.json")
  end
end
