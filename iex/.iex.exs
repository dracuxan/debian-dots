IEx.configure(
  # Main prompt
  default_prompt: "λ > ",

  # Prompt when connected to a distributed node
  alive_prompt: "λ > ",

  # Prompt when IEx is waiting for more input
  continuation_prompt: "...> "
)

# Optional helper functions
defmodule Helpers do
  def neo, do: IEx.Helpers.clear()
end

import Helpers
