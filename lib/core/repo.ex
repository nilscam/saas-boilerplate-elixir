defmodule Core.Repo do
  use Ecto.Repo,
    otp_app: :core,
    adapter: Ecto.Adapters.Postgres


  @callback format_tuple(ressource :: Ecto.Schema.t() | nil) :: {:ok, Ecto.Schema.t()} | {:error, :not_found}
  def format_tuple(schema_or_nil) do
    case schema_or_nil do
      nil -> {:error, :not_found}
      ressource -> {:ok, ressource}
    end
  end
end
