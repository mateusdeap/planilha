defmodule PlanilhaWeb.PlanejamentoController do
  use PlanilhaWeb, :controller

  alias Planilha.Planejamentos
  alias Planilha.Planejamentos.Planejamento

  def index(conn, _params) do
    planejamentos = Planejamentos.list_planejamentos()
    render(conn, "index.html", planejamentos: planejamentos)
  end

  def new(conn, _params) do
    changeset = Planejamentos.change_planejamento(%Planejamento{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"planejamento" => planejamento_params}) do
    case Planejamentos.create_planejamento(planejamento_params) do
      {:ok, planejamento} ->
        conn
        |> put_flash(:info, "Planejamento created successfully.")
        |> redirect(to: Routes.planejamento_path(conn, :show, planejamento))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    planejamento = Planejamentos.get_planejamento!(id)
    render(conn, "show.html", planejamento: planejamento)
  end

  def edit(conn, %{"id" => id}) do
    planejamento = Planejamentos.get_planejamento!(id)
    changeset = Planejamentos.change_planejamento(planejamento)
    render(conn, "edit.html", planejamento: planejamento, changeset: changeset)
  end

  def update(conn, %{"id" => id, "planejamento" => planejamento_params}) do
    planejamento = Planejamentos.get_planejamento!(id)

    case Planejamentos.update_planejamento(planejamento, planejamento_params) do
      {:ok, planejamento} ->
        conn
        |> put_flash(:info, "Planejamento updated successfully.")
        |> redirect(to: Routes.planejamento_path(conn, :show, planejamento))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", planejamento: planejamento, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    planejamento = Planejamentos.get_planejamento!(id)
    {:ok, _planejamento} = Planejamentos.delete_planejamento(planejamento)

    conn
    |> put_flash(:info, "Planejamento deleted successfully.")
    |> redirect(to: Routes.planejamento_path(conn, :index))
  end
end
