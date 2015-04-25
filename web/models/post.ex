defmodule LiveBlog.Post do
  use LiveBlog.Web, :model
  use Ecto.Model.Callbacks

  after_insert :broadcast

  schema "posts" do
    field :title, :string

    timestamps
  end

  @required_fields ~w(title)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def broadcast(changeset) do
    IO.puts "new post created"
    LiveBlog.Endpoint.broadcast! "posts:all", "new_post", %{content: changeset.changes.title}
    changeset
  end
end
