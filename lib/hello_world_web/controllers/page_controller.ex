defmodule HelloWorldWeb.PageController do
  use HelloWorldWeb, :controller

  def index(conn, _params) do
    star_pattern = generate_star_pattern(5)
    text conn, star_pattern
  end

  defp generate_star_pattern(n) do
    1..n
    |> Enum.map(fn i -> String.duplicate("*", i) end)
    |> Enum.join("\n")
  end
end
