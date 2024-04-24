return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			vim.keymap.set("n", "<leader>ghp", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>gnn", ":Gitsigns nav_hunk next<CR>", {})
			vim.keymap.set("n", "<leader>gnp", ":Gitsigns nav_hunk prev<CR>", {})
		end,
	},
}
