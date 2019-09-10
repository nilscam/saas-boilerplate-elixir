defmodule Core.Schema.BillingPlan do
  @moduledoc false

  use Core.Model
  import Ecto.Changeset

  alias Core.Schema.BillingPlan

  schema "billing_plans" do
    field :name, :string
    field :price, Money.Ecto.Amount.Type

    field :max_users, :integer
    field :max_arrival_rate, :integer
    field :max_projects, :integer

    timestamps()
  end

  @doc false
  def changeset(%BillingPlan{} = sub, attrs) do
    sub
    |> cast(attrs, [:name, :price, :max_users, :max_arrival_rate, :max_projects])
    |> validate_required([:name, :price, :max_users, :max_arrival_rate, :max_projects])
  end
end
