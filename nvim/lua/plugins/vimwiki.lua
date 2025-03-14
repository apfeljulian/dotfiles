if true then
	return {}
end

return {
	"vimwiki/vimwiki",
	init = function()
		vim.g.vimwiki_list = {
			{
				path = "~/docs/vimwiki",
				syntax = "markdown",
				ext = "md",
			},
		}
	end,
	vim.keymap.set("n", "<leader>w<leader>n", "<cmd>VimwikiDiaryNextDay<CR>", { desc = "Next day diary" }),
	vim.keymap.set("n", "<leader>w<leader>p", "<cmd>VimwikiDiaryPrevDay<CR>", { desc = "Previous day diary" }),
	vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { remap = false, desc = "Next Buffer" }),
}
