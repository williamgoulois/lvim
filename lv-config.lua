--[[
O is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general

O.format_on_save = true
O.lint_on_save = true
O.completion.autocomplete = true
O.colorscheme = "spacegray"
O.default_options.wrap = true
O.default_options.timeoutlen = 100
O.leader_key = " "

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
O.plugin.dashboard.active = true
O.plugin.terminal.active = true
O.plugin.zen.active = false
O.plugin.zen.window.height = 0.90
O.plugin.nvimtree.side = "left"

-- dashboard
O.plugin.dashboard.custom_header = {
  "            ██                                                                                           ",
  "           ███                                                                                           ",
  "          ▓███                                                                                           ",
  "▓████████▌                                                                                               ",
  "█████████                                                                                                ",
  "████████                                                                                                 ",
  "╙╙╙╙╙╙╙█▓▓b         @▓▓▓▓    ▄▓µ     ▓▓▓▓▌    ▓▓▓▓▌   ▓▓▓▓▄   ▐▓µ  ▓⌐   ,▄▓▓▓▄   %▓   ▄▓   @▓▓▓▓   ▓▌    ",
  "      ▐███▌         ██▄▄    ▐█╙█     ██▄▄█▀   █▌▄▄   j█▄ ▄█⌐  ╫██▌ █µ  ▐█╨   ██   ██ ▐█─   ╫█▄▄    ██    ",
  "     .████▌         ██└└   ╓██▓██    █▌ └██   █▌└└   j█▀▀█▄   ╫█ ▀██µ  ╙█▄  ,██    ███▀    ╫█└└    ██    ",
  "▄▄▄▄▄╙▀▀▀▀¬         ╙▀     ▀╙   ▀▀   ▀▀▀▀▀    ▀▀▀▀▀   ▀  ╙▀   ╙▀  ╙▀     ▀▀▀▀└      ▀▀     ╙▀▀▀▀   ▀▀▀▀▀ ",
  "████▀                                                                                                    ",
  "███▌                                                                                                     ",
  "███                                                                                                      ",
  "██                                                                                                       ",
  "█╜                                                                                                       ",
}
O.plugin.dashboard.footer = { "Welcome to LunarVim" }

-- if you don't want all the parsers change this to a table of the ones you want
O.treesitter.ensure_installed = "maintained"
O.treesitter.ignore_install = { "haskell" }
O.treesitter.highlight.enabled = true

-- javascript
O.lang.tsserver.linter = "eslint_d"
O.lang.tsserver.formatter.exe = "prettier"

-- Additional Plugins
O.user_plugins = {
  {
    "mg979/vim-visual-multi",
    branch = "master",
  },
  {
    "p00f/nvim-ts-rainbow",
    config = function()
      require("nvim-treesitter.configs").setup {
        rainbow = {
          enable = true,
          extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
          max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
        },
      }
    end,
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- O.user_autocommands = {{ "BufWinEnter", "*", "echo \"hi again\""}}
