defmodule PromExTestWeb.PageController do
  use PromExTestWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
