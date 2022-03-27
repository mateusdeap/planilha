defmodule Planilha.CategoriaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Planilha.Categoria` context.
  """

  @doc """
  Generate a categorias.
  """
  def categorias_fixture(attrs \\ %{}) do
    {:ok, categorias} =
      attrs
      |> Enum.into(%{
        descricao: "some descricao"
      })
      |> Planilha.Categoria.create_categorias()

    categorias
  end
end
