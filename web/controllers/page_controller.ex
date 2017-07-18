defmodule Groceryshop.PageController do
  use Groceryshop.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
