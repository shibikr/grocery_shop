defmodule Groceryshop.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string, null: false
      add :code, :string, null: false, size: 10
      add :price, :decimal, precision: 7, scale: 2

      timestamps()
    end

    create unique_index(:products, ["lower(code)"])

  end
end
