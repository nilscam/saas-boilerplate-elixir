defmodule CoreWeb.FallbackController do
  use Phoenix.Controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:bad_request)
    |> json(%{
      errors: Ecto.Changeset.traverse_errors(changeset, &CoreWeb.ErrorHelpers.translate_error/1)
    })
  end

  def call(conn, {_err, status}), do: send_error_from_status(conn, status)
  def send_error_from_status(conn, status) do
    code = Plug.Conn.Status.code(status)
    strcode = Integer.to_string(code)

    conn
    |> put_status(status)
    |> put_view(CoreWeb.ErrorView)
    |> render(strcode <> ".json")
  end


end
