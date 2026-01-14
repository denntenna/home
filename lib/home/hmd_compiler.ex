defmodule Home.HMDCompiler do

  @spec scan(String.t()):: map()
  def scan(text) do
    lines = String.split(text, "\n")
    |> Enum.map(&String.trim/1)

    lines
    |> Enum.map(&tokenize/1)
    |> Enum.map(&IO.inspect/1)

    %{}
  end

  def tokenize("---") do
    %{
      type: "FRONTMATTER_OPEN_CLOSE",
      value: "---"
    }
  end

  def tokenize (":::") do
    %{
      type: "EMBEDDED_DSL_END",
      value: ":::"
    }
  end

  def tokenize (":::"<>code) do
    %{
      type: "EMBEDDED_DSL_"<>String.upcase(code),
      value: ":::"<>code
    }
  end

  def tokenize (line_text) do
    %{
      type: "LINE_TEXT",
      value: line_text
    }
  end


end
