defmodule Planilha.ContasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Planilha.Contas` context.
  """

  @doc """
  Generate a conta.
  """
  def conta_fixture(attrs \\ %{}) do
    {:ok, conta} =
      attrs
      |> Enum.into(%{
        balanco: 42,
        nome: "some nome"
      })
      |> Planilha.Contas.create_conta()

    conta
  end
end
