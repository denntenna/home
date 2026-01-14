defmodule Home.ASTTest do
  alias Home.AST
  use ExUnit.Case

  describe "ast" do
    test "new/1" do
      ast = AST.new(%{type: "SECTION_FRONTMATTER_OPEN_CLOSE", value: "---"})
    end
  end
end
