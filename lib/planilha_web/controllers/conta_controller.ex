defmodule PlanilhaWeb.ContaController do
  use PlanilhaWeb, :controller

  alias Planilha.Contas
  alias Planilha.Contas.Conta

  def index(conn, _params) do
    contas = Contas.list_contas()
    render(conn, "index.html", contas: contas)
  end

  def new(conn, _params) do
    changeset = Contas.change_conta(%Conta{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"conta" => conta_params}) do
    case Contas.create_conta(conta_params) do
      {:ok, conta} ->
        conn
        |> put_flash(:info, "Conta created successfully.")
        |> redirect(to: Routes.conta_path(conn, :show, conta))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    conta = Contas.get_conta!(id)
    render(conn, "show.html", conta: conta)
  end

  def edit(conn, %{"id" => id}) do
    conta = Contas.get_conta!(id)
    changeset = Contas.change_conta(conta)
    render(conn, "edit.html", conta: conta, changeset: changeset)
  end

  def update(conn, %{"id" => id, "conta" => conta_params}) do
    conta = Contas.get_conta!(id)

    case Contas.update_conta(conta, conta_params) do
      {:ok, conta} ->
        conn
        |> put_flash(:info, "Conta updated successfully.")
        |> redirect(to: Routes.conta_path(conn, :show, conta))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", conta: conta, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    conta = Contas.get_conta!(id)
    {:ok, _conta} = Contas.delete_conta(conta)

    conn
    |> put_flash(:info, "Conta deleted successfully.")
    |> redirect(to: Routes.conta_path(conn, :index))
  end
end
