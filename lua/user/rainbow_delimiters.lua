local M = {}

M.config = function()
  -- This module contains a number of default definitions
  local rainbow_delimiters = require "rainbow-delimiters"

  vim.g.rainbow_delimiters = {
    strategy = {
      [""] = rainbow_delimiters.strategy["global"],
      commonlisp = rainbow_delimiters.strategy["local"],
    },
    query = {
      [""] = "rainbow-delimiters",
      javascript = "rainbow-parens",
      tsx = "rainbow-parens",
      lua = "rainbow-blocks",
    },
    highlight = {
      "RainbowDelimiterRed",
      "RainbowDelimiterYellow",
      "RainbowDelimiterBlue",
      "RainbowDelimiterOrange",
      "RainbowDelimiterGreen",
      "RainbowDelimiterViolet",
      "RainbowDelimiterCyan",
    },
    blacklist = { "c", "cpp" },
  }
end

return M
