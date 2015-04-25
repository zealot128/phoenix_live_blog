defmodule LiveBlog.PageControllerTest do
  use LiveBlog.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert conn.resp_body =~ "Welcome to Phoenix!"
  end
end
