defmodule AnimeList.Animes do
  @moduledoc """
  The Animes context.
  """

  import Ecto.Query, warn: false
  alias AnimeList.Repo

  alias AnimeList.Animes.Anime

  @doc """
  Returns the list of animes.

  ## Examples

      iex> list_animes()
      [%Anime{}, ...]

  """
  def list_animes do
    Repo.all(Anime)
  end

  @doc """
  Gets a single anime.

  Raises `Ecto.NoResultsError` if the Anime does not exist.

  ## Examples

      iex> get_anime!(123)
      %Anime{}

      iex> get_anime!(456)
      ** (Ecto.NoResultsError)

  """
  def get_anime!(id), do: Repo.get!(Anime, id)

  @doc """
  Creates a anime.

  ## Examples

      iex> create_anime(%{field: value})
      {:ok, %Anime{}}

      iex> create_anime(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_anime(attrs \\ %{}) do
    %Anime{}
    |> Anime.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a anime.

  ## Examples

      iex> update_anime(anime, %{field: new_value})
      {:ok, %Anime{}}

      iex> update_anime(anime, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_anime(%Anime{} = anime, attrs) do
    anime
    |> Anime.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a anime.

  ## Examples

      iex> delete_anime(anime)
      {:ok, %Anime{}}

      iex> delete_anime(anime)
      {:error, %Ecto.Changeset{}}

  """
  def delete_anime(%Anime{} = anime) do
    Repo.delete(anime)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking anime changes.

  ## Examples

      iex> change_anime(anime)
      %Ecto.Changeset{data: %Anime{}}

  """
  def change_anime(%Anime{} = anime, attrs \\ %{}) do
    Anime.changeset(anime, attrs)
  end
end
