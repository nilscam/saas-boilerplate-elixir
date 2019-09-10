defmodule Core.Guardian.AuthPipeline do
  @moduledoc false

  use Guardian.Plug.Pipeline, otp_app: :core, module: Core.Guardian, error_handler: CoreWeb.FallbackController

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
