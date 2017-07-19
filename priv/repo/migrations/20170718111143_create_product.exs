defmodule Groceryshop.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string, null: false
      add :code, :string, null: false, size: 10
      add :price, :decimal, precision: 7, scale: 2

      timestamps()
    end
    #    TODO: [Prasun] case insensitive where clause for constraints
    unique_index(:products, :code)

  end
end
