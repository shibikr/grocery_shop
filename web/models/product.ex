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
#    |> validate_number(:price, greater_than: 0)
    |> validate_length(:name, min: 0, max: 10)
#    |> validate_length(:code, greater_than: 9)
#    |> unique_constraints(:code)
  end

end
