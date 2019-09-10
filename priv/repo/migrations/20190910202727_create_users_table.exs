defmodule Core.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :username, :string
      add :email, :string
      add :encrypted_password, :string

      timestamps()
    end
  end
end
