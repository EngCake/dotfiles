return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup({
			compile = true,
		})
		vim.cmd("colorscheme kanagawa-dragon")

		-- Transparent numbers column
		vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE", fg = "#5c6370" }) -- Line number color
		vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE", fg = "#c678dd" }) -- Highlighted line number
	end,
}
