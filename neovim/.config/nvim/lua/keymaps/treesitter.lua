local ts_utils = require("nvim-treesitter.ts_utils")

vim.keymap.set("n", "]n", function()
	local node = ts_utils.get_node_at_cursor()
	if not node then
		return
	end

	local next_node = ts_utils.get_next_node(node)
	if next_node then
		ts_utils.goto_node(next_node)
	end
end, {
	desc = "Go the next AST node",
})

vim.keymap.set("n", "[n", function()
	local node = ts_utils.get_node_at_cursor()
	if not node then
		return
	end

	local prev_node = ts_utils.get_previous_node(node)
	if prev_node then
		ts_utils.goto_node(prev_node)
	end
end, {
	desc = "Go the next AST node",
})
