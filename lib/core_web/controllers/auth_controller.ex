defmodule CoreWeb.AuthController do
  use CoreWeb, :controller

  action_fallback CoreWeb.FallbackController

  def login(conn, params) do
    with {:ok, user} <- Core.User.email_password_auth(params),
         {:ok, token, _claims} <- Core.Guardian.encode_and_sign(user)
    do
      conn |> render("auth.json", %{jwt: token, user: user})
    end
  end

  def register(conn, params) do
    with {:ok, user} <- Core.User.create(params),
         {:ok, token, _claims} <- Core.Guardian.encode_and_sign(user)
    do
      conn |> render("auth.json", %{jwt: token, user: user})
    end
  end
end
