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

  test "product price should not be negative" do
    changeset = Product.changeset(%Product{}, %{name: "product", price: "-20"})
    refute changeset.valid?
  end

  test "product price can be zero" do
    changeset = Product.changeset(%Product{}, %{name: "product", price: "0"})
    refute changeset.valid?
  end

  # test "product name should be unique" do
  #   changeset = Product.changeset(%Product{}, %{name: "product", price: "2"})
  #   assert changeset.valid?
  #   Repo.insert(changeset)
  #   changeset = Product.changeset(%Product{}, %{name: "product", price: "4"})
  #   refute changeset.valid?
  # end
end
