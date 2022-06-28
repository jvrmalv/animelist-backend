defmodule AnimeList.Accounts.User do
  use Ecto.Schema

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string, redact: true
    has_many :anime, Anime
  end

  @cast_fields [
    :name,
    :password,
    :email
  ]

  @required_fields [
    :name,
    :password,
    :email
  ]

  def changeset(user, attrs) do
   user
   |> cast(attrs, cast_fields)
   |> cast_assoc(attrs, :anime)
   |> validate_required(required_fields)
   |> hash_password(attrs.[:password])
  end

  def hash_password(%Ecto.Changeset{valid?: true, changes: [%{password: _}]} = changeset, password) do
    changeset
    |> change(add_hash(password, hash_key: :password))
  end
end
