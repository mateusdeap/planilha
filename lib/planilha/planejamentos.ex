defmodule Planilha.Planejamentos do
  @moduledoc """
  The Planejamentos context.
  """

  import Ecto.Query, warn: false
  alias Planilha.Repo

  alias Planilha.Planejamentos.Planejamento

  @doc """
  Returns the list of planejamentos.

  ## Examples

      iex> list_planejamentos()
      [%Planejamento{}, ...]

  """
  def list_planejamentos do
    Repo.all(Planejamento)
  end

  @doc """
  Gets a single planejamento.

  Raises `Ecto.NoResultsError` if the Planejamento does not exist.

  ## Examples

      iex> get_planejamento!(123)
      %Planejamento{}

      iex> get_planejamento!(456)
      ** (Ecto.NoResultsError)

  """
  def get_planejamento!(id), do: Repo.get!(Planejamento, id)

  @doc """
  Creates a planejamento.

  ## Examples

      iex> create_planejamento(%{field: value})
      {:ok, %Planejamento{}}

      iex> create_planejamento(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_planejamento(attrs \\ %{}) do
    %Planejamento{}
    |> Planejamento.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a planejamento.

  ## Examples

      iex> update_planejamento(planejamento, %{field: new_value})
      {:ok, %Planejamento{}}

      iex> update_planejamento(planejamento, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_planejamento(%Planejamento{} = planejamento, attrs) do
    planejamento
    |> Planejamento.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a planejamento.

  ## Examples

      iex> delete_planejamento(planejamento)
      {:ok, %Planejamento{}}

      iex> delete_planejamento(planejamento)
      {:error, %Ecto.Changeset{}}

  """
  def delete_planejamento(%Planejamento{} = planejamento) do
    Repo.delete(planejamento)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking planejamento changes.

  ## Examples

      iex> change_planejamento(planejamento)
      %Ecto.Changeset{data: %Planejamento{}}

  """
  def change_planejamento(%Planejamento{} = planejamento, attrs \\ %{}) do
    Planejamento.changeset(planejamento, attrs)
  end
end
