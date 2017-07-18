defmodule Groceryshop.CartDetailControllerTest do
  use Groceryshop.ConnCase

  alias Groceryshop.CartDetail
  @valid_attrs %{quantity: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, cart_detail_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing cart details"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, cart_detail_path(conn, :new)
    assert html_response(conn, 200) =~ "New cart detail"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, cart_detail_path(conn, :create), cart_detail: @valid_attrs
    assert redirected_to(conn) == cart_detail_path(conn, :index)
    assert Repo.get_by(CartDetail, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, cart_detail_path(conn, :create), cart_detail: @invalid_attrs
    assert html_response(conn, 200) =~ "New cart detail"
  end

  test "shows chosen resource", %{conn: conn} do
    cart_detail = Repo.insert! %CartDetail{}
    conn = get conn, cart_detail_path(conn, :show, cart_detail)
    assert html_response(conn, 200) =~ "Show cart detail"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, cart_detail_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    cart_detail = Repo.insert! %CartDetail{}
    conn = get conn, cart_detail_path(conn, :edit, cart_detail)
    assert html_response(conn, 200) =~ "Edit cart detail"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    cart_detail = Repo.insert! %CartDetail{}
    conn = put conn, cart_detail_path(conn, :update, cart_detail), cart_detail: @valid_attrs
    assert redirected_to(conn) == cart_detail_path(conn, :show, cart_detail)
    assert Repo.get_by(CartDetail, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    cart_detail = Repo.insert! %CartDetail{}
    conn = put conn, cart_detail_path(conn, :update, cart_detail), cart_detail: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit cart detail"
  end

  test "deletes chosen resource", %{conn: conn} do
    cart_detail = Repo.insert! %CartDetail{}
    conn = delete conn, cart_detail_path(conn, :delete, cart_detail)
    assert redirected_to(conn) == cart_detail_path(conn, :index)
    refute Repo.get(CartDetail, cart_detail.id)
  end
end
