if vim.g.loaded_nvim_swell ~= nil then
	return
end
vim.g.loaded_nvim_swell = 1

local swell = require("swell")

vim.api.nvim_create_user_command("SwellToggle", function()
	swell.toggle_current_window()
end, {})

vim.keymap.set("n", "<Plug>(swell-toggle)", function()
	swell.toggle_current_window()
end)
