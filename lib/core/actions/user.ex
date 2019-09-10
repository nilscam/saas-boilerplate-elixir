defmodule Core.User do

  import Ecto.Changeset

  alias Core.Repo
  alias Core.Schema.User

  def get(id), do: Repo.get(User, id) |> Repo.format_tuple
  def get_by_email(email), do: Repo.get_by(User, email: email) |> Repo.format_tuple

  def create(%{username: _, email: _, password: password} = params) do
    encrypted_password = Bcrypt.hash_pwd_salt(password)

    User.changeset(%User{}, params)
    |> put_change(:encrypted_password, encrypted_password)
    |> Repo.insert
  end

  def email_password_auth(%{email: email, password: password} = params) do
    with {:ok, user} <- get_by_email(email), do: verify_password(password, user)
  end

  def verify_password(password, %User{} = user) when is_binary(password) do
    case Bcrypt.verify_pass(password, user.encrypted_password) do
      true -> {:ok, user}
      false -> {:error, :unauthorized}
    end
  end
end
