defmodule Groceryshop.ProductTest do
  use Groceryshop.ModelCase

  alias Groceryshop.Product

  @valid_attrs %{name: "some content", price: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Product.changeset(%Product{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Product.changeset(%Product{}, @invalid_attrs)
    refute changeset.valid?
  end
end
