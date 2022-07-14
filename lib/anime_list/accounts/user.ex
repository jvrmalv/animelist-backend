defmodule AnimeList.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @cast_fields [
    :email,
    :password
  ]

  @required_fields [
    :email,
    :password
  ]

  @doc false
  def changeset(user \\  %__MODULE__{} , attrs) do
    user
    |> cast(attrs, @cast_fields)
    |> validate_required(@required_fields)
    |> validate_format(:email, ~r/^[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/)
    |> validate_length(:password, min: 7)
    |> unique_constraint(:email)
    |> put_hashed_password
  end

  defp put_hashed_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        change(changeset, Argon2.add_hash(password, hash_key: :encrypted_password))
      _ ->
        changeset
     end
   end
 end
