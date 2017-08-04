defmodule Citybuilder.Repo.Migrations.AddUserModifiedToComments do
  use Ecto.Migration

  def change do
    alter table(:stories_comments) do
      add :modified_by_id, references(:auths_users)
      add :removed_by_owner, :boolean, null: false, default: false
      add :removed_by_moderator, :boolean, null: false, default: false
    end
  end
end
