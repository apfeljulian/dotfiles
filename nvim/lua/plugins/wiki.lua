return {
	{
		"lervag/wiki.vim",
		-- tag = "v0.10", -- uncomment to pin to a specific release
		init = function()
			-- wiki.vim configuration goes here, e.g.
			vim.keymap.set("n", "<leader>wjn", "<cmd>WikiJournalNext<CR>", { desc = "" })
			vim.keymap.set("n", "<leader>wjp", "<cmd>WikiJournalPrev<CR>", { desc = "" })
		end,
	},
}
