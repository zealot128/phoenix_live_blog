defmodule LiveBlog.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LiveBlog do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/posts", PostsController, :index
  end

  socket "/ws/posts", LiveBlog do
    channel "posts:all", PostsChannel
  end
  # Other scopes may use custom stacks.
  # scope "/api", LiveBlog do
  #   pipe_through :api
  # end
end
