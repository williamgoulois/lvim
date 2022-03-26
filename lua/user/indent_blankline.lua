local M = {}

M.config = function()
	local status_ok, indent_blankline= pcall(require, "indent_blankline")
	if not status_ok then
		print("Error starting git-worktree")
		return
	end
  -- vim.cmd [[highlight IndentBlanklineChar guifg=#E06C75 gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineSpaceChar guifg=#E5C07B gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineSpaceCharBlankline guifg=#98C379 gui=nocombine]]
  vim.cmd [[highlight IndentBlanklineContextChar guifg=#56B6C2 gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineContextStart guifg=#61AFEF gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
  vim.g.indent_blankline_char = "▏"
  vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
  vim.g.indent_blankline_buftype_exclude = {"terminal"}
  vim.g.indent_blankline_show_trailing_blankline_indent = false
  vim.g.indent_blankline_show_first_indent_level = false
  vim.g.indent_blankline_use_treesiter = true
  vim.g.indent_blankline_context_patters = {"if", "class"," function", "method"}

	indent_blankline.setup {
    show_current_context = true,
    show_current_context_start = true,
    space_char_blankline = " ",
  }
end

return M
