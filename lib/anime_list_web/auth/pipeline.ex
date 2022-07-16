defmodule AnimeListWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :anime_list,
    module: AnimeListWeb.Auth.Guardian,
    error_handler: AnimeListWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
