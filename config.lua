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
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.setup.filters.dotfiles = false
lvim.builtin.nvimtree.setup.git.ignore= true
lvim.builtin.telescope.defaults.layout_config.prompt_position = "top"
lvim.builtin.telescope.defaults.sorting_strategy = "ascending"
local actions = require("telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
	i = {
		["<ESC>"] = actions.close,
	},
}

-- dashboard
lvim.builtin.alpha.mode = "custom"
	local alpha_opts = require("user.dashboard").config()
	lvim.builtin.alpha["custom"] = {config = alpha_opts}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = false

-- LSP
lvim.lsp.diagnostics.virtual_text = false
lvim.lsp.automatic_servers_installation = true

-- Keybindings
vim.api.nvim_set_keymap("n", "<Left>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Down>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Up>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Right>", "<C-w>l", { noremap = true, silent = true })

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

-- Prettier configuration
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{
		exe = "prettier",
		filetypes = {
			"javascriptreact",
			"javascript",
			"typescriptreact",
			"typescript",
			"json",
			"markdown",
      "yaml",
      "css",
      "less"
		},
	},
})

-- ESLint
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{
		exe = "eslint_d",
		filetypes = {
			"javascriptreact",
			"javascript",
			"typescriptreact",
			"typescript",
			"vue",
		},
	},
})

-- Additional Plugins
lvim.plugins = {
	{ "lunarvim/colorschemes" },

	{
		"sindrets/diffview.nvim",
		event = "BufRead",
		config = function()
			require("user.diffview").config()
		end,
	},
  -- {"lukas-reineke/indent-blankline.nvim",
  --   config= function()
  --     require("user.indent_blankline").config()
  --   end},
  {'ThePrimeagen/git-worktree.nvim',
    config= function()
			vim.cmd([[packadd telescope.nvim]])
      require("user.git_worktree").config()
    end},
	{
		"mg979/vim-visual-multi",
		branch = "master",
	},
{
      "kevinhwang91/nvim-bqf",
    ft='qf',
      config = function()
        require("user.bqf").config()
      end,
event= { "BufRead", "BufNew" },
    },
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
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
	{
		"tzachar/cmp-tabnine",
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			local tabnine = require("cmp_tabnine.config")
			tabnine:setup({
				max_lines = 1000,
				max_num_results = 10,
				sort = true,
			})
		end,
},
  -- interferes with nvim-bqf
	   --  {
    --   "nathom/filetype.nvim",
    --   config = function()
    --     require("user.filetype").config()
    --   end,
    -- },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.user_autocommands = {{"","",""}}
