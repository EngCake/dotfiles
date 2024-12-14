local utils = require("utils")

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

---@type integer|nil
_G.repl_window_id = nil
---@type integer|nil
_G.repl_channel_id = nil

---Check if REPL window is already created or not
---@return boolean
local function is_repl_window_created()
	return _G.repl_window_id ~= nil and vim.api.nvim_win_is_valid(_G.repl_window_id)
end

---Create REPL window
local function create_repl_window()
	local old_window = vim.api.nvim_get_current_win()
	vim.cmd("vsplit")
	vim.cmd("vertical resize 100")
	local window_id = vim.api.nvim_get_current_win()
	_G.repl_window_id = window_id
	local buffer_id = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_win_set_buf(window_id, buffer_id)
	local repl = vim.fn.input({
		prompt = "REPL: ",
		default = "python",
	})
	_G.repl_channel_id = vim.fn.termopen(repl)
	vim.api.nvim_set_current_win(old_window)
end

---Close REPL window
local function close_repl_window()
	vim.api.nvim_win_close(_G.repl_window_id, true)
	_G.repl_window_id = nil
	print("Closed REPL split")
end

---Send text lines to the terminal REPL
---@param lines string|string[]
local function send_to_repl(lines)
	if not is_repl_window_created() then
		print("No terminal window found!")
		return
	end

	if type(lines) == "string" then
		vim.api.nvim_chan_send(_G.repl_channel_id, lines .. "\n")
	else
		for _, line in ipairs(lines) do
			vim.api.nvim_chan_send(_G.repl_channel_id, line .. "\n")
		end
		vim.api.nvim_chan_send(_G.repl_channel_id, "\n")
	end
end

vim.keymap.set("n", "<leader>R", function()
	if is_repl_window_created() then
		close_repl_window()
	else
		create_repl_window()
	end
end, { desc = "Toggle [R]EPL window" })

-- Run the selected text in the terminal REPL
vim.keymap.set("v", "<Enter>", function()
	local lines = utils.get_selected_text()
	send_to_repl(lines)
end, { desc = "Run selection in the terminal REPL" })
