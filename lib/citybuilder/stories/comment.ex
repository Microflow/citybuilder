defmodule LiveStory.Stories.Comment do
  use Ecto.Schema

  schema "stories_comments" do
    field :body, :string
    field :user_name, :string
    field :removed_by_owner, :boolean, default: false
    field :removed_by_moderator, :boolean, default: false
    belongs_to :user, LiveStory.Auths.User
    belongs_to :modified_by, LiveStory.Auths.User
    belongs_to :post, LiveStory.Stories.Post
    has_one :upvotes_count, LiveStory.Stories.CommentUpvotesCount

    timestamps()
  end
end
