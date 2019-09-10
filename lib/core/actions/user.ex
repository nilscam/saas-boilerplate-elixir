defmodule Core.User do

  alias Core.Repo
  alias Core.Schema.User

  def get(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end

  def create(params) do
    {:error, :bad_request}
  end

  def email_password_auth(params) do
    {:error, :not_found}
  end
end
