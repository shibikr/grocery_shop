defmodule Groceryshop.CartTest do
  use Groceryshop.ModelCase

  alias Groceryshop.Cart

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Cart.changeset(%Cart{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Cart.changeset(%Cart{}, @invalid_attrs)
    refute changeset.valid?
  end
end
