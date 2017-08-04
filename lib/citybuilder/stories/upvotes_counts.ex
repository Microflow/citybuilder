defmodule Citybuilder.Stories.UpvotesCounts do
  use Ecto.Schema

  schema "stories_upvotes_counts" do
    field :count, :integer, null: false, read_after_writes: true
    belongs_to :post, Citybuilder.Stories.Post

    timestamps()
  end
end
