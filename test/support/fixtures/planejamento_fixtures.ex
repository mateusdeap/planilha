defmodule Planilha.PlanejamentoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Planilha.Planejamento` context.
  """

  @doc """
  Generate a planejamentos.
  """
  def planejamentos_fixture(attrs \\ %{}) do
    {:ok, planejamentos} =
      attrs
      |> Enum.into(%{
        gasto_total_atual: 42,
        gasto_total_planejado: 42,
        mes: "some mes",
        renda_total_atual: 42,
        renda_total_panejada: 42
      })
      |> Planilha.Planejamento.create_planejamentos()

    planejamentos
  end
end
