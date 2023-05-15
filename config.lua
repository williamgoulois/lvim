-- Current neovim commit https://github.com/neovim/neovim/commit/3098064f332ffbc59c342545402e2d2da798a458
--

-- Neovim
-- =========================================
lvim.format_on_save = true
lvim.leader = " "
lvim.colorscheme = "darkplus" -- set to a custom theme
lvim.builtin.time_based_themes = false -- set false to use your own configured theme
lvim.transparent_window = false -- enable/disable transparency
lvim.debug = false
vim.lsp.set_log_level "error"
lvim.log.level = "warn"
-- vim.o.conceallevel = 2 -- uncomment if you want to see concealed text
require("user.neovim").config()
lvim.lsp.code_lens_refresh = true
lvim.lsp.installer.setup.automatic_installation = false

-- Customization
-- =========================================
lvim.builtin.sell_your_soul_to_devil = { active = false, prada = false } -- if you want microsoft to abuse your soul
lvim.builtin.lastplace = { active = false } -- change to false if you are jumping to future
lvim.builtin.tabnine = { active = true } -- change to false if you don't like tabnine
lvim.builtin.persistence = { active = true } -- change to false if you don't want persistence
lvim.builtin.presence = { active = false } -- change to true if you want discord presence
lvim.builtin.orgmode = { active = false } -- change to true if you want orgmode.nvim
lvim.builtin.dap.active = false -- change this to enable/disable debugging
lvim.builtin.fancy_statusline = { active = true } -- enable/disable fancy statusline
lvim.builtin.fancy_wild_menu = { active = false } -- enable/disable cmp-cmdline
lvim.builtin.fancy_diff = { active = false } -- enable/disable fancier git diff
lvim.builtin.lua_dev = { active = true } -- change this to enable/disable folke/lua_dev
lvim.builtin.test_runner = { active = true, runner = "ultest" } -- change this to enable/disable ultest or neotest
lvim.builtin.cheat = { active = false } -- enable/disable cheat.sh integration
lvim.builtin.sql_integration = { active = false } -- use sql integration
lvim.builtin.smooth_scroll = "" -- for smoth scrolling, can be "cinnamon", "neoscroll" or ""
lvim.builtin.neoclip = { active = true, enable_persistent_history = false }
lvim.builtin.nonumber_unfocus = false -- diffrentiate between focused and non focused windows
lvim.builtin.custom_web_devicons = false -- install https://github.com/Nguyen-Hoang-Nam/mini-file-icons
lvim.builtin.harpoon = { active = true } -- use the harpoon plugin
lvim.builtin.remote_dev = { active = false } -- enable/disable remote development
lvim.builtin.cursorline = { active = false } -- use a bit fancier cursorline
lvim.builtin.motion_provider = "hop" -- change this to use different motion providers ( hop or leap )
lvim.builtin.hlslens = { active = false } -- enable/disable hlslens
lvim.builtin.csv_support = false -- enable/disable csv support
lvim.builtin.sidebar = { active = false } -- enable/disable sidebar
lvim.builtin.task_runner = "" -- change this to use different task runners ( "async_tasks" or "overseer" or "")
lvim.builtin.winbar_provider = "filename" -- can be "filename" or "treesitter" or "navic" or ""
lvim.builtin.metals = {
  active = false, -- enable/disable nvim-metals for scala development
  fallbackScalaVersion = "3.2.0-RC3",
  serverVersion = "0.11.8",
}
lvim.builtin.collaborative_editing = { active = false } -- enable/disable collaborative editing
lvim.builtin.file_browser = { active = false } -- enable/disable telescope file browser
lvim.builtin.sniprun = { active = false } -- enable/disable sniprun
lvim.builtin.tag_provider = "symbols-outline" -- change this to use different tag providers ( symbols-outline or vista )
lvim.builtin.global_statusline = false -- set true to use global statusline
lvim.builtin.dressing = { active = false } -- enable to override vim.ui.input and vim.ui.select with telescope
lvim.builtin.refactoring = { active = false } -- enable to use refactoring.nvim code_actions
lvim.builtin.tmux_lualine = false -- use vim-tpipeline to integrate lualine and tmux
lvim.builtin.lsp_lines = false -- enable/disable lsp_lines to display lsp virtual text below instead of behind
lvim.builtin.legendary = { active = false } -- enable/disable legendary plugin ( ctrl-p command )
lvim.builtin.tree_provider = "nvimtree" -- can be "neo-tree" or "nvimtree" or ""
lvim.builtin.lir.active = false
lvim.builtin.breadcrumbs.active = false
lvim.builtin.illuminate.active = false
lvim.builtin.indentlines.active = true
lvim.builtin.noice = { active = false } -- enables noice.nvim and inc-rename.nvim
lvim.builtin.go_programming = { active = false } -- gopher.nvim + nvim-dap-go
lvim.builtin.python_programming = { active = false } -- swenv.nvim + nvim-dap-python + requirements.txt.vim
lvim.builtin.web_programming = { active = false } -- typescript.nvim + package-info.nvim
lvim.builtin.rust_programming = { active = false } -- rust_tools.nvim + crates.nvim
lvim.builtin.cpp_programming = { active = false } -- clangd_extensions.nvim + make-tools.nvim
lvim.builtin.cmp.cmdline.enable = false
lvim.builtin.borderless_cmp = false
lvim.builtin.colored_args = false -- if true then sets up hlargs.nvim
lvim.builtin.bigfile.active = true
lvim.builtin.inlay_hints = { active = false } -- enable/disable inlay hints
-- WARN: mind plugin is deprecated ( use with caution )
lvim.builtin.mind = { active = false, root_path = "~/.mind" } -- enable/disable mind.nvim

-- Custom User Config
-- =========================================
local user = vim.env.USER
if user and user == "abz" then
  lvim.reload_config_on_save = true
  require("user.custom_user").config()
end

-- Additional Actions Based on Custom User Config
-- =========================================

if user and user == "William.Goulois" then
  lvim.builtin.inlay_hints.active = true
  lvim.reload_config_on_save = false -- NOTE: i don't like this
  lvim.builtin.web_programming.active = true
  lvim.builtin.go_programming.active = false
  lvim.builtin.python_programming.active = false
  lvim.builtin.rust_programming.active = false

  -- vim.api.nvim_set_hl(0, "DiffAdd", { fg = "#87afff", bg = "#262626", reverse = true })
  -- vim.api.nvim_set_hl(0, "DiffChange", { fg = "#dfdfdf", bg = "#262626", reverse = true })
  -- vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#ffdf87", bg = "#262626", reverse = true })
  -- vim.api.nvim_set_hl(0, "DiffText", { fg = "#afafaf", bg = "#262626", reverse = true })
  -- WARN: these only work on neovim head
  vim.opt.mousescroll = { "ver:1", "hor:6" }
  vim.o.mousefocus = true
  vim.o.mousemoveevent = true
  vim.o.splitkeep = "screen"
  ---

  lvim.builtin.trouble = { active = false } -- enable/disable trouble for diagnostics
  lvim.builtin.persistence = { active = true } -- change to false if you don't want persistence
  lvim.builtin.dap.active = true -- change this to enable/disable debugging
  lvim.builtin.fancy_wild_menu = { active = true } -- enable/disable cmp-cmdline
  lvim.builtin.fancy_diff = { active = true } -- enable/disable fancier git diff
  lvim.builtin.refactoring.active = true
  lvim.builtin.lua_dev = { active = true } -- change this to enable/disable folke/lua_dev
  lvim.builtin.test_runner = { active = true, runner = "neotest" } -- change this to enable/disable ultest or neotest
  lvim.builtin.cheat = { active = false } -- enable/disable cheat.sh integration
  lvim.builtin.sql_integration = { active = true } -- use sql integration
  -- postgres://user:secret@localhost:5432/mydatabasename
  lvim.builtin.smooth_scroll = "" -- for smoth scrolling, can be "cinnamon", "neoscroll" or ""
  lvim.builtin.custom_web_devicons = true -- install https://github.com/Nguyen-Hoang-Nam/mini-file-icons
  lvim.builtin.harpoon = { active = false } -- use the harpoon plugin

  lvim.builtin.tag_provider = nil -- change this to use different tag providers ( symbols-outline or vista )
  lvim.builtin.global_statusline = true -- set true to use global statusline
  lvim.builtin.dressing = { active = true } -- enable to override vim.ui.input and vim.ui.select with telescope
  lvim.builtin.indentlines.active = false

  lvim.builtin.tmux_lualine = true -- WARN: doesn't work with neovim nightly
  if lvim.builtin.tmux_lualine then
    vim.opt.cmdheight = 0
    vim.opt.laststatus = 0
    vim.g.tpipeline_cursormoved = 1
    -- HACK: lualine hijacks the statusline, so we need to set it back to what we want
    if vim.env.TMUX then
      vim.cmd [[ autocmd WinEnter,BufEnter,VimResized * setlocal laststatus=0 ]]
    end
  end

  lvim.builtin.lsp_lines = true -- enable/disable lsp_lines to display lsp virtual text below instead of behind
  lvim.lsp.diagnostics.virtual_text = true --remove this line if you want to see inline errors
  if lvim.builtin.lsp_lines then
    lvim.lsp.diagnostics.virtual_text = false
    vim.diagnostic.config { virtual_lines = false } -- i only want to use it explicitly ( by calling the toggle function)
  end

  lvim.builtin.tree_provider = "neo-tree" -- can be "neo-tree" or "nvimtree" or ""

  lvim.builtin.treesitter.rainbow.enable = true
  -- lvim.builtin.notify.opts.level = "WARN" -- hover with multiple lsp servers produces info
  lvim.builtin.noice.active = true -- WARN: https://github.com/folke/noice.nvim/issues/298

  lvim.format_on_save = {
    pattern = "*.rs",
    timeout = 2000,
    filter = require("lvim.lsp.utils").format_filter,
  }

  lvim.builtin.borderless_cmp = true
  lvim.builtin.colored_args = true

  vim.g.db_ui_use_nerd_fonts = true
  vim.g.db_ui_show_database_icon = true
  vim.g.db_ui_win_position = 'right'
  vim.g.db_ui_auto_execute_table_helpers = true
  vim.g.db_ui_execute_on_save = false
end

if lvim.builtin.winbar_provider == "navic" then
  vim.opt.showtabline = 1
  lvim.keys.normal_mode["<tab>"] =
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>"
  lvim.builtin.bufferline.active = false
  lvim.builtin.breadcrumbs.active = true
end
if lvim.builtin.breadcrumbs.active and lvim.builtin.noice.active then
  table.insert(lvim.builtin.breadcrumbs.winbar_filetype_exclude, "vim")
end
lvim.builtin.nvimtree.active = lvim.builtin.tree_provider == "nvimtree"
lvim.builtin.latex = {
  view_method = "skim", -- change to zathura if you are on linux
  preview_exec = "/Applications/Skim.app/Contents/SharedSupport/displayline", -- change this to zathura as well
  rtl_support = true, -- if you want to use xelatex, it's a bit slower but works very well for RTL langs
  active = false, -- set to true to enable
}

if lvim.builtin.cursorline.active then
  lvim.lsp.document_highlight = false
end

-- Override Lunarvim defaults
-- =========================================

-- LunarVim builtin config
-- =========================================
require("user.builtin").config()

-- StatusLine
-- =========================================
if lvim.builtin.fancy_statusline.active then
  require("user.lualine").config()
end

-- Debugging
-- =========================================
if lvim.builtin.dap.active then
  require("user.dap").config()
end

-- Language Specific
-- =========================================
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, {
  "angularls",
  "clangd",
  "dockerls",
  "gopls",
  "golangci_lint_ls",
  "jdtls",
  "pyright",
  "rust_analyzer",
  "taplo",
  "texlab",
  "tsserver",
  "yamlls",
  "jsonls",
  "tailwindcss",
  "spectral",
})
require("user.null_ls").config()

-- Additional Plugins
-- =========================================
require("user.plugins").config()

-- FIXME Bug with multiple lsp and hover
require("notify").setup { level = "WARN" }

-- Autocommands
-- =========================================
require("user.autocommands").config()

-- Additional Keybindings
-- =========================================
require("user.keybindings").config()
