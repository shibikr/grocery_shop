defmodule Groceryshop.Product do
  use Groceryshop.Web, :model
# Copy schema for this table here
  schema "products" do
    field :name, :string
    field :code, :string
    field :price, :decimal

    timestamps()
  end

  @required_fields ~w(name code price)
  @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(Enum.map(@required_fields, &String.to_atom(&1)))
    |> validate_number(:price, greater_than_or_equal_to: 0.00)
    |> validate_number(:price, less_than_or_equal_to: 9999999.99)
    |> validate_length(:name, min: 1)
    |> validate_length(:code, min: 10)
    |> unique_constraint(:code)
  end

end
