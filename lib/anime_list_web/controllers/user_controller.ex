defmodule AnimeListWeb.UserController do
  use AnimeListWeb, :controller

  alias AnimeList.Accounts
  alias AnimeList.Accounts.User
  alias AnimeListWeb.Auth.Guardian

  action_fallback AnimeListWeb.FallbackController


  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> render("user.json", %{user: user, token: token})
    end
  end
end
