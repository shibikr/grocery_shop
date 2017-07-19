defmodule Groceryshop.BuyerControllerTest do
  use Groceryshop.ConnCase

  alias Groceryshop.Buyer
  @valid_attrs %{email: "john@doe.me", name: "John Doe"}
  @invalid_attrs %{email: "johnatdoe.me", name: "John Doe"}
  @incorrect_name_attrs %{email: "johnatdoe.me", name: ""}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, buyer_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing buyers"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, buyer_path(conn, :new)
    assert html_response(conn, 200) =~ "New buyer"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, buyer_path(conn, :create), buyer: @valid_attrs
    assert redirected_to(conn) == buyer_path(conn, :index)
    assert Repo.get_by(Buyer, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, buyer_path(conn, :create), buyer: @invalid_attrs
    assert html_response(conn, 200) =~ "New buyer"
  end

  test "does not create resource and renders errors when name is of length zero", %{conn: conn} do
    conn = post conn, buyer_path(conn, :create), buyer: @incorrect_name_attrs
    assert html_response(conn, 200) =~ "New buyer"
  end

  test "shows chosen resource", %{conn: conn} do
    buyer = Repo.insert! Buyer.changeset(%Buyer{}, @valid_attrs)
    conn = get conn, buyer_path(conn, :show, buyer)
    assert html_response(conn, 200) =~ "Show buyer"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, buyer_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    buyer = Repo.insert! Buyer.changeset(%Buyer{}, @valid_attrs)
    conn = get conn, buyer_path(conn, :edit, buyer)
    assert html_response(conn, 200) =~ "Edit buyer"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    buyer = Repo.insert! Buyer.changeset(%Buyer{}, @valid_attrs)
    conn = put conn, buyer_path(conn, :update, buyer), buyer: @valid_attrs
    assert redirected_to(conn) == buyer_path(conn, :show, buyer)
    assert Repo.get_by(Buyer, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    buyer = Repo.insert! Buyer.changeset(%Buyer{}, @valid_attrs)
    conn = put conn, buyer_path(conn, :update, buyer), buyer: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit buyer"
  end

  test "deletes chosen resource", %{conn: conn} do
    buyer = Repo.insert! Buyer.changeset(%Buyer{}, @valid_attrs)
    conn = delete conn, buyer_path(conn, :delete, buyer)
    assert redirected_to(conn) == buyer_path(conn, :index)
    refute Repo.get(Buyer, buyer.id)
  end
end
