require Ecto.Query
defmodule LiveBlog.PostsController do
  use LiveBlog.Web, :controller
  plug :action

  def index(conn, _params) do
    events = LiveBlog.Repo.all(LiveBlog.Post |> Ecto.Query.order_by([c], desc: c.inserted_at) )
    render conn, :index, posts: events
  end
end
