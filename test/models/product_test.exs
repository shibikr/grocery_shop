defmodule Groceryshop.ProductTest do
  use Groceryshop.ModelCase

  alias Groceryshop.Product

  @valid_attrs %{name: "some content", code: "ABC1234567", price: "120.5"}
  @attrs_with_invalid_code %{name: "some content", code: "ABC567", price: "120.5"}
  @attrs_with_invalid_name %{name: "", code: "ABC567", price: "120.5"}
  @attrs_with_invalid_price %{name: "", code: "ABC567", price: "10000000"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Product.changeset(%Product{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid code" do
    changeset = Product.changeset(%Product{},@attrs_with_invalid_code)
    refute changeset.valid?
  end

  test "changeset with name as empty string" do
    changeset = Product.changeset(%Product{},@attrs_with_invalid_name)
    refute changeset.valid?
  end

  test "changeset with invalid price" do
    changeset = Product.changeset(%Product{},@attrs_with_invalid_price)
    refute changeset.valid?
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
