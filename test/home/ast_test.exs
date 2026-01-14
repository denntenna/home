defmodule Home.ASTTest do
  alias Home.AST
  use ExUnit.Case

  describe "ast" do
    test "new/1" do
      ast = AST.new()

      [
        %{type: "SECTION_FRONTMATTER_OPEN_CLOSE", value: "---"},
        %{type: "LINE_TEXT", value: "title: Hello World"},
        %{type: "LINE_TEXT", value: "date: 02-06-1990"},
        %{type: "LINE_TEXT", value: "tags:"},
        %{type: "LINE_TEXT", value: "- announcement"},
        %{type: "LINE_TEXT", value: "- happy"},
        %{type: "SECTION_FRONTMATTER_OPEN_CLOSE", value: "---"},
      ]
      |> Enum.reduce(ast, fn token, ast ->
        AST.parse(ast, token)
      end)
      |> IO.inspect()


    end
  end
end
