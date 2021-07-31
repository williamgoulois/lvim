local M = {}

M.config = function()
	local status_ok, matchup = pcall(require, "nvim-treesitter.configs")
	if not status_ok then
		print("Error starting matchup")
		return
	end
	matchup.setup({
		matchup = {
			enable = true,
		},
	})
end

return M
