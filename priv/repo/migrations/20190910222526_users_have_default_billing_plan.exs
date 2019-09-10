defmodule Core.Repo.Migrations.UsersHaveDefaultBillingPlan do
  use Ecto.Migration

  def up() do

    default_billing_plan = %Core.Schema.BillingPlan{
      name: "Free",
      price: Money.new(0, :USD),
      max_users: 50,
      max_arrival_rate: 5,
      max_projects: 1
    }

    with {:ok, sub} <- Core.Repo.insert default_billing_plan do
      alter table(:users) do
        add :billing_plan_id, references(:billing_plans, type: :uuid), default: sub.id
      end

      flush()

      create index(:users, [:billing_plan_id])
    end

  end

  def down() do
    drop index(:users, [:billing_plan_id])

    flush()

    alter table(:users) do
      remove :billing_plan_id
    end
  end
end
