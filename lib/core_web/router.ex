defmodule CoreWeb.Router do
  use CoreWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticated do
    plug :accepts, ["json"]
    # plug Core.Guardian.AuthPipeline
  end

  scope "/auth", CoreWeb do
    pipe_through :api

    post "/login", AuthController, :login
    post "/register", AuthController, :register
  end


end
