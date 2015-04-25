defmodule LiveBlog.PostsChannel do
  use Phoenix.Channel

  def join("posts:all", auth_msg, socket) do
    {:ok, socket}
  end

  def handle_in("new_post", %{"content" => content}, socket) do
    IO.puts "did receive shit"
    broadcast! socket, "new_post", %{content: content}
    {:noreply, socket }
  end

#   def handle_out("new_post", %{content: content}, socket) do
#     IO.puts "did receive shit hoen"
#     push socket, "new_post", %{content: content}
#     {:noreply, socket }
#   end

end
