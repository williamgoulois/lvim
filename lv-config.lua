--[[
O is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = false
lvim.lint_on_save = true
lvim.colorscheme = "darkplus"
lvim.leader = "space"
vim.opt.wrap = true

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.telescope.defaults.hide_dotfiles = false
lvim.builtin.telescope.defaults.hidden = false

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
lvim.builtin.treesitter.highlight.enabled = true

-- LSP
lvim.lsp.diagnostics.virtual_text = false
-- json
require("user.json_schemas").setup()
require("user.yaml_schemas").setup()
require("user.js_schemas").setup()
-- javascript
lvim.lang.javascript.linters = { "eslint_d" }
lvim.lang.javascriptreact.linters = { "eslint_d" }
lvim.lang.typescript.linters = { "eslint_d" }
lvim.lang.typescriptreact.linters = { "eslint_d" }

-- Keybindings
require("utils").add_keymap_insert_mode({ silent = true, expr = true }, {
	{ "<right>", "compe#confirm('<CR>')" },
})
require("utils").add_keymap_normal_mode({ noremap = true, silent = true }, {
	{ "<left>", "<C-w>h" },
	{ "<down>", "<C-w>j" },
	{ "<up>", "<C-w>k" },
	{ "<right>", "<C-w>l" },
})

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
