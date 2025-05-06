-- Keymaps for better default experience

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- For conciseness
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Allow moving the cursor through wrapped lines with j, k
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- clear highlights
vim.keymap.set("n", "<Esc>", ":noh<CR>", { noremap = true, silent = true })

-- save file without auto-formatting
vim.keymap.set("n", "<C-s>", "<cmd>noautocmd w <CR>", { noremap = true, silent = true })

-- delete single character without copying into register
-- vim.keymap.set('n', 'x', '"_x', { noremap = true, silent = true })

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- Find and center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Down>", ":resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>x", ":Bdelete!<CR>", { noremap = true, silent = true })    -- close buffer
vim.keymap.set("n", "<leader>bn", "<cmd> enew <CR>", { noremap = true, silent = true }) -- new buffer

-- Increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>", { noremap = true, silent = true }) -- increment
vim.keymap.set("n", "<leader>-", "<C-x>", { noremap = true, silent = true }) -- decrement

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", { noremap = true, silent = true })  -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", { noremap = true, silent = true })  -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { noremap = true, silent = true }) -- make split windows equal width & height
-- vim.keymap.set("n", "<leader>xs", ":close<CR>", { noremap = true, silent = true }) -- close current split window

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { noremap = true, silent = true })

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { noremap = true, silent = true })   -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { noremap = true, silent = true }) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { noremap = true, silent = true })     --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { noremap = true, silent = true })     --  go to previous tab

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", { noremap = true, silent = true })

-- Press jk fast to exit insert mode
vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("i", "kj", "<ESC>", { noremap = true, silent = true })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- Move text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- vim.keymap.set('v', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
-- vim.keymap.set('v', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true })

-- Replace word under cursor
-- vim.keymap.set('n', '<leader>j', '*``cgn', { noremap = true, silent = true })

-- Explicitly yank to system clipboard (highlighted and entire row)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Toggle diagnostics
local diagnostics_active = true

vim.keymap.set("n", "<leader>do", function()
	diagnostics_active = not diagnostics_active

	if diagnostics_active then
		vim.diagnostic.enable(0)
	else
		vim.diagnostic.disable(0)
	end
end)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Save and load session
vim.keymap.set("n", "<leader>ss", ":mksession! .session.vim<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>sl", ":source .session.vim<CR>", { noremap = true, silent = false })

vim.keymap.set("n", "<leader>ll", "<cmd>Lazy<CR>", { noremap = true, silent = true, desc = "Lazy Plugin Manager" })
