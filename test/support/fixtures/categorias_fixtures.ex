defmodule Planilha.CategoriasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Planilha.Categorias` context.
  """

  @doc """
  Generate a categoria.
  """
  def categoria_fixture(attrs \\ %{}) do
    {:ok, categoria} =
      attrs
      |> Enum.into(%{
        descricao: "some descricao"
      })
      |> Planilha.Categorias.create_categoria()

    categoria
  end
end
