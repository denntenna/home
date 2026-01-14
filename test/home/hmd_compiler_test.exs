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

      assert HMDCompiler.scan(text) == %{}
    end


  end
end
