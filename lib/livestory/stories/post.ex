defmodule LiveStory.Stories.Post do
  use Ecto.Schema

  schema "stories_posts" do
    field :body, :string
    field :title, :string
    field :published, :boolean, default: true
    field :path, :string, null: false, read_after_writes: true
    belongs_to :user, LiveStory.Auths.User
    belongs_to :original_post, LiveStory.Stories.Post

    timestamps()
  end
end
