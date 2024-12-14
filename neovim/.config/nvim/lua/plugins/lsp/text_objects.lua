return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	main = "nvim-treesitter.configs",
	opts = {
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<leader>ss",
				node_incremental = "<leader>si",
				node_decremental = "<leader>sd",
				scope_incremental = "<leader>sc",
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = {
						query = "@function.outer",
						desc = "outer part of function",
					},
					["if"] = {
						query = "@function.inner",
						desc = "inner part of function",
					},
					["ac"] = {
						query = "@class.outer",
						desc = "outer part of class",
					},
					["ic"] = {
						query = "@class.inner",
						desc = "inner part of class",
					},
				},
				selection_modes = {
					["@parameter.outer"] = "v",
					["@function.outer"] = "V",
					["@class.outer"] = "<c-v>",
				},
				include_surrounding_whitespace = false,
			},
		},
	},
}
