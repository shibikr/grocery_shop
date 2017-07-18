defmodule Groceryshop.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :price, :float

      timestamps()
    end

  end
end
