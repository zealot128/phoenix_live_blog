defmodule LiveBlog.PostsController do
  use LiveBlog.Web, :controller
  plug :action

  def index(conn, _params) do
    render conn, :index, posts: Repo.all(LiveBlog.Post)
  end
end
