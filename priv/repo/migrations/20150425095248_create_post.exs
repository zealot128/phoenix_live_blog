defmodule LiveBlog.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :text

      timestamps
    end
  end
end
