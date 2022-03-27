defmodule Planilha.Repo.Migrations.CreatePlanejamentos do
  use Ecto.Migration

  def change do
    create table(:planejamentos) do
      add :mes, :string
      add :gasto_total_planejado, :integer
      add :gasto_total_atual, :integer
      add :renda_total_panejada, :integer
      add :renda_total_atual, :integer

      timestamps()
    end
  end
end
