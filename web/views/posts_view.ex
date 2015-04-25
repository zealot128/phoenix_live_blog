defmodule LiveBlog.PostsView do
  use LiveBlog.Web, :view

  def time_format(ecto_datetime) do
    parsed_date = Moment.parse!(Ecto.DateTime.to_string(ecto_datetime), "YYYY-MM-DD HH:mm:ss")
    Moment.format(parsed_date, "DD.MM.YY, HH:mm:ss")
  end
end
