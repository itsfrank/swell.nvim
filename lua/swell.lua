local function get_win_info(win_handle)
	return {
		handle = win_handle,
		height = vim.api.nvim_win_get_height(win_handle),
		width = vim.api.nvim_win_get_width(win_handle),
	}
end

local M = {}

M._window_memory = {}

M._config = {
	swell_width = 1000000,
	swell_height = 1000000,
}

function M.is_swolen()
	return #M._window_memory ~= 0
end

function M.swell_window(window_handle)
	if M.is_swolen() then
		vim.notify("nvim-swell: a window is already swolen.", vim.log.levels.ERROR, { title = "nvim-swell" })
	end

	local windows = vim.api.nvim_list_wins()
	for _, window in ipairs(windows) do
		table.insert(M._window_memory, get_win_info(window))
	end

	vim.api.nvim_win_set_width(window_handle, M._config.swell_width)
	vim.api.nvim_win_set_height(window_handle, M._config.swell_height)
end

function M.unswell()
	for _, window_info in ipairs(M._window_memory) do
		if vim.api.nvim_win_is_valid(window_info.handle) then
			vim.api.nvim_win_set_width(window_info.handle, window_info.width)
			vim.api.nvim_win_set_height(window_info.handle, window_info.height)
		end
	end
	M._window_memory = {}
end

function M.toggle_current_window()
	if M.is_swolen() then
		M.unswell()
	else
		local current_window = vim.api.nvim_get_current_win()
		M.swell_window(current_window)
	end
end

return M
