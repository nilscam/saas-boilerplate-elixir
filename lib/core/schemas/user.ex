defmodule Core.Schema.User do
  @moduledoc false

  use Core.Model
  import Ecto.Changeset

  alias Core.Schema.{User, BillingPlan}

  schema "users" do
    field :username, :string
    field :email, :string

    field :encrypted_password, :string
    field :password, :string, virtual: true

    belongs_to :subscription_plan, BillingPlan

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password])
    |> validate_required([:username, :email, :password])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 4)
  end

  def modify(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password])
  end
end
