defmodule Home.HMDCompiler do

  @spec scan(String.t()):: map()
  def scan(text) do
    lines = String.split(text, "\n")
    |> Enum.map(&String.trim/1)

    lines
    |> Enum.map(&tokenize/1)
  end

  def tokenize("---") do
    %{
      type: "SECTION_FRONTMATTER_OPEN_CLOSE",
      value: "---"
    }
  end

  def tokenize (":::") do
    %{
      type: "SECTION_EMBEDDED_END",
      value: ":::"
    }
  end

  def tokenize (":::"<>code) do
    %{
      type: "SECTION_EMBEDDED_"<>String.upcase(code),
      value: ":::"<>code
    }
  end

  def tokenize (line_text) do
    %{
      type: "LINE_TEXT",
      value: line_text
    }
  end

  def parse(tokens) do
    tokens
    |> Enum.reduce([], fn token, ast ->
      last_item = Enum.at(ast, -1)
      last_item_type = Map.get(last_item, :type)
      token_type = token.type
      # is_subsection = last_item_type == token.type

      case last_item_type do
        "LINE_TEXT" ->
          # add to the last item's children
          %{}
        ^token_type ->
          # this is the closing tag
          %{}
        _ ->
          # new tag
          %{}

      end
    end)
    # |> Enum.map(&IO.inspect/1)
  end



end
