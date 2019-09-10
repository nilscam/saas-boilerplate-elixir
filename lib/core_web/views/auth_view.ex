defmodule CoreWeb.AuthView do
  use CoreWeb, :view

  def render("auth.json", %{jwt: jwt, user: user}) do
    %{
      jwt: jwt,
      user: render_one(user, CoreWeb.UserView, "user.json")
    }
  end
end
