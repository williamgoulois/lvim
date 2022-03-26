local M = {}

M.config = function()
  vim.cmd "let g:VM_theme = 'iceblue'"
  vim.cmd "let g:VM_mouse_mappings = 1"

  vim.cmd "let g:VM_maps = {}"

  -- Remap to Control-D to match VSCode
  vim.cmd "let g:VM_maps['Find Under']         = '<C-d>'"
  vim.cmd "let g:VM_maps['Find Subword Under'] = '<C-d>'"

  -- -- Remap Undo and redo
  -- vim.cmd "let g:VM_leader = {'default': '', 'visual': '', 'buffer': ''}"
  -- vim.cmd "let g:VM_maps['Undo']      = 'u'"
  -- vim.cmd "let g:VM_maps['Redo']      = '<C-r>'"
end

return M
