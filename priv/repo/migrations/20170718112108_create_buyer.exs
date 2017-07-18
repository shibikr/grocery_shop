defmodule Groceryshop.Repo.Migrations.CreateBuyer do
  use Ecto.Migration

  def change do
    create table(:buyers) do
      add :name, :string
      add :email, :string

      timestamps()
    end

  end
end
