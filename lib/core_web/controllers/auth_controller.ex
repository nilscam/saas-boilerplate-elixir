defmodule CoreWeb.AuthController do
  use CoreWeb, :controller

  action_fallback CoreWeb.FallbackController

  def login(conn, %{"email" => email, "password" => password}) do
    with {:ok, user} <- Core.User.email_password_auth(%{email: email, password: password}),
         {:ok, token, _claims} <- Core.Guardian.encode_and_sign(user)
    do
      conn |> render("auth.json", %{jwt: token, user: user})
    end
  end

  def register(conn, %{"username" => username, "email" => email, "password" => password}) do
    with {:ok, user} <- Core.User.create(%{username: username, email: email, password: password}),
         {:ok, token, _claims} <- Core.Guardian.encode_and_sign(user)
    do
      conn |> render("auth.json", %{jwt: token, user: user})
    end
  end
end
