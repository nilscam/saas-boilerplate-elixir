defmodule CoreWeb.UserView do
  use CoreWeb, :view

  def render("user.json", %{user: user}) do
    %{
      id: user.id
    }
  end
end
