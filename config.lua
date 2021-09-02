--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
lvim.debug = false
lvim.log.level = "warn"

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "darkplus"
lvim.leader = "space"
lvim.line_wrap_cursor_movement = false
vim.opt.wrap = true

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.telescope.defaults.layout_config.prompt_position = "top"
lvim.builtin.telescope.defaults.sorting_strategy = "ascending"

local actions = require("telescope.actions")
lvim.builtin.telescope.defaults.mappings.i["<ESC>"] = actions.close

-- dashboard
lvim.builtin.dashboard.custom_header = {
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
lvim.builtin.dashboard.footer = { "Welcome to LunarVim" }

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = false

-- LSP
lvim.lsp.diagnostics.virtual_text = false
lvim.lang.tailwindcss.lsp.active = true
-- schemas
require("user.json_schemas").setup()
require("user.yaml_schemas").setup()
require("user.js_schemas").setup()

-- Keybindings
vim.api.nvim_set_keymap("n", "<Left>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Down>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Up>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Right>", "<C-w>l", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<right>", "compe#confirm('<CR>')", { silent = true, expr = true })

-- Whichkey custom keymaps
lvim.builtin.which_key.mappings["ss"] = {
	"<cmd>lua require'spectre'.open()<CR>",
	"Spectre",
}
lvim.builtin.which_key.mappings["si"] = {
	"<cmd>lua require'spectre'.open_file_search()<CR>",
	"Spectre opened file",
}
lvim.builtin.which_key.vmappings["s"] = {
	"<cmd>lua require'spectre'.open_visual({select_word=true})<CR>",
	"Spectre selected word",
}

-- Additional Plugins
lvim.plugins = {
	{ "lunarvim/colorschemes" },
	{
		"mg979/vim-visual-multi",
		branch = "master",
	},
	{
		"sindrets/diffview.nvim",
		event = "BufRead",
	},
	{
		"kevinhwang91/nvim-bqf",
		event = "BufRead",
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
	},
	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
	},
	{
		"nvim-telescope/telescope-project.nvim",
		event = "BufWinEnter",
		setup = function()
			vim.cmd([[packadd telescope.nvim]])
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		config = function()
			vim.g.mkdp_auto_close = 0
		end,
		run = "cd app && npm install",
		ft = "markdown",
	},
	{
		"windwp/nvim-spectre",
		event = "BufRead",
		config = function()
			require("user.spectre").config()
		end,
	},
	{
		"kevinhwang91/rnvimr",
		config = function()
			require("user.rnvimr")
		end,
	},
	{
		"folke/zen-mode.nvim",
		config = function()
			require("user.zen").config()
		end,
	},
	{
		"andymass/vim-matchup",
		event = "CursorMoved",
		config = function()
			require("user.matchup").config()
		end,
	},
	{
		"nacro90/numb.nvim",
		event = "BufRead",
		config = function()
			require("user.numb").config()
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		config = function()
			require("user.lsp_signature").config()
		end,
	},
	{
		"p00f/nvim-ts-rainbow",
		config = function()
			require("user.tsrainbow").config()
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("user.colorizer").config()
		end,
	},
	{
		"editorconfig/editorconfig-vim",
	},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.user_autocommands = {{"","",""}}
