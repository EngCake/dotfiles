local M = {}

---Returns the current selected line(s)
---@return string|string[]
M.get_selected_text = function()
	local start_line = vim.fn.getpos(".")[2]
	local end_line = vim.fn.getpos("v")[2]
	if end_line < start_line then
		local temp = end_line
		end_line = start_line
		start_line = temp
	end
	local lines = vim.fn.getline(start_line, end_line)
	vim.fn.feedkeys(":", "nx")
	return lines
end

return M
