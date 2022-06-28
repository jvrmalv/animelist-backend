defmodule AnimeList.Accounts do

  alias Animelist.User

  @type create_args %{
    required(:name) => String.t(),
    required(:email) => String.t(),
    required(:password) => String.t(),
    optional(:anime) => [String.t()]
  }

  @spec create(create_args) :: {:ok, type} | {:error, type}
  def create(attrs) do
   %User
   |> User.changeset(attrs)
   |> Repo.insert()
  end

end
