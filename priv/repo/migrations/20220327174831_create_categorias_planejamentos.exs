defmodule Planilha.Repo.Migrations.CreateCategoriasPlanejamentos do
  use Ecto.Migration

  def change do
    create table(:categorias_planejamentos) do
      add :categoria_id, references(:categorias)
      add :planejamento_id, references(:planejamentos)
    end

    create unique_index(:categorias_planejamentos, [:categoria_id, :planejamento_id])
  end
end
