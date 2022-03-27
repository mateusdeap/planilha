defmodule Planilha.PlanejamentosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Planilha.Planejamentos` context.
  """

  @doc """
  Generate a planejamento.
  """
  def planejamento_fixture(attrs \\ %{}) do
    {:ok, planejamento} =
      attrs
      |> Enum.into(%{
        gasto_total_atual: 42,
        gasto_total_planejado: 42,
        mes: "some mes",
        renda_total_atual: 42,
        renda_total_panejada: 42
      })
      |> Planilha.Planejamentos.create_planejamento()

    planejamento
  end
end
