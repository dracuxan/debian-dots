IEx.configure(
  # Main prompt
  default_prompt: "λ > ",

  # Prompt when connected to a distributed node
  alive_prompt: "λ (#{IO.ANSI.cyan()}%node#{IO.ANSI.reset()}) >"
)

# Optional helper functions
defmodule Helpers do
  def neo, do: IEx.Helpers.clear()
end

import Helpers
