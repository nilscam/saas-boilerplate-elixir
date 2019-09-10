defmodule Core.Guardian do
  use Guardian, otp_app: :core

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    user = Core.User.get(id)
    {:ok,  user}
  end
end