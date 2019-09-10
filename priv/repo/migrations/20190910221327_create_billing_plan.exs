defmodule Core.Repo.Migrations.CreateBillingPlan do
  use Ecto.Migration

  def change do
    create table(:billing_plans, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string

      add :price, :integer

      add :max_users, :integer
      add :max_arrival_rate, :integer
      add :max_projects, :integer

      timestamps()
    end

    # billing plan only have uniques name (easier to find them as admin)
    create unique_index(:billing_plans, [:name])
  end
end
