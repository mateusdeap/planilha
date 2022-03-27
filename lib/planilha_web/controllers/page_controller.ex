defmodule PlanilhaWeb.PageController do
  use PlanilhaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
