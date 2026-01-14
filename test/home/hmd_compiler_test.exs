defmodule Home.HMDCompilerTest do
  alias Home.HMDCompiler
  use ExUnit.Case

  describe "compiler" do
    test "scan" do
      text = """
      ---
        title: Hello World
        date: 02-06-1990
        tags:
          - announcement
          - happy
      ---
      # Its my Birthday
      Hello world. I wanted to announce that its my birthday.
      You are invited to the party. Please make sure you bring the following :

      ## Essential Gifts
      - chocolate
      - toys
      - mud

      ## Useful Formulae
      :::latex
      \begin{equation}
      a^2 + b^2 = c^2
      \end{equation}
      :::

      ## Useful Links
      [[Address]]
      [[Dress Code]]
      """

      assert is_list(HMDCompiler.scan(text)) == true
    end

    test "parse frontmatter" do
      tokens = [
        %{type: "SECTION_FRONTMATTER_OPEN_CLOSE", value: "---"},
        %{type: "LINE_TEXT", value: "title: Hello World"},
        %{type: "LINE_TEXT", value: "date: 02-06-1990"},
        %{type: "LINE_TEXT", value: "tags:"},
        %{type: "LINE_TEXT", value: "- announcement"},
        %{type: "LINE_TEXT", value: "- happy"},
        %{type: "SECTION_FRONTMATTER_OPEN_CLOSE", value: "---"},
      ]

      # HMDCompiler.parse(tokens)

      assert 1 == 1
    end
  end
end
