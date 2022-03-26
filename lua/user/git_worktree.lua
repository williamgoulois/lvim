local M = {}

M.config = function()
	local status_ok, git_worktree = pcall(require, "git-worktree")
	if not status_ok then
		print("Error starting git-worktree")
		return
	end
  require("telescope").load_extension("git_worktree")
	git_worktree.setup()
end

return M
