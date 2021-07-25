--[[
O is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "spacegray"
lvim.leader = "space"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

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

lvim.lsp.diagnostics.virtual_text = false

-- javascript
lvim.lang.javascript.linters = { "eslint_d" }
lvim.lang.javascriptreact.linters = { "eslint_d" }
lvim.lang.typescript.linters = { "eslint_d" }
lvim.lang.typescriptreact.linters = { "eslint_d" }

require("lv-utils").add_keymap_insert_mode({ silent = true, expr = true }, {
	{ "<right>", "compe#confirm('<CR>')" },
})

-- Additional Plugins
lvim.plugins = {
	{
		"mg979/vim-visual-multi",
		branch = "master",
	},
	{
		"p00f/nvim-ts-rainbow",
		config = function()
			require("nvim-treesitter.configs").setup({
				rainbow = {
					enable = true,
					extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
					max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
				},
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").on_attach()
		end,
		event = "InsertEnter",
	},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- O.user_autocommands = {{ "CursorMoved", "*.tsx", "lua echo_diagnostic()"}}
