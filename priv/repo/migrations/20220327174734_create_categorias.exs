defmodule Planilha.Repo.Migrations.CreateCategorias do
  use Ecto.Migration

  def change do
    create table(:categorias) do
      add :descricao, :string

      timestamps()
    end
  end
end
