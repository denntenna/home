defmodule Home.AST do
  alias Home.AST
  defstruct [:id, :data, :children]

  def new(data) do
    %AST{
      id: "",
      data: data,
      children: []
    }
  end

  def new() do
    %AST{
      id: "",
      data: nil,
      children: []
    }
  end

  def push?(%{type: token_type}) do

  end

  def add_new_node(%AST{} = ast, node)  do
    %{ast | children: ast.children ++ [node]}
  end

  def add_to_last_node_children(%AST{} = ast, %AST{} = node) do

  end
end
