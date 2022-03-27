defmodule Planilha.Repo.Migrations.CreateContas do
  use Ecto.Migration

  def change do
    create table(:contas) do
      add :nome, :string
      add :balanco, :integer

      timestamps()
    end
  end
end
