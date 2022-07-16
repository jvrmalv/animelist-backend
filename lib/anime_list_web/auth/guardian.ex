defmodule AnimeListWeb.Auth.Guardian do
  use Guardian, otp_app: :anime_list

  alias AnimeList.Accounts

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end


  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Accounts.get_user!(id)
    {:ok, resource}
  end

  def authenticate(email, password) do
    with {:ok, user} <- Accounts.get_by_email(email) do
      case validate_password(user, password) do
        {:ok, _user}->
          create_token(user)
        {:error, error } ->
          {:error, :unauthorized}
      end
    end
  end

  defp validate_password(user, password) do
    Argon2.check_pass(user, password)
  end

  defp create_token(user) do
    {:ok, token, _claims} = encode_and_sign(user)
    {:ok, user, token}
  end
end
