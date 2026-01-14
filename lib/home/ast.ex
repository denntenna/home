defmodule Home.AST do
  alias Home.AST
  defstruct [:id, :data, :children, :stack]

  def parse(%AST{}=ast, token) do
    case action_to_take(ast, token) do
      :new_node -> put_in(ast[:children], ast[:children]++[token])
      _ -> ast
    end
  end

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
      data: %{type: "EMPTY"},
      children: []
    }
  end

  def action_to_take(%AST{}=ast, %{type: token_type}=token) do
    last_type = ast.data.type

    case last_type do
      ^token_type -> :close_node
      nil -> :new_node
      _ -> :append
    end
  end

  def add_new_node(%AST{} = ast, node)  do
    %{ast | children: ast.children ++ [node]}
  end

  def add_to_last_node_children(%AST{} = ast, %AST{} = node) do

  end
end
