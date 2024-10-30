--  See `:help vim.keymap.set()`

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

keymap.set("i", "<C-l>", "<Left>", { desc = "Move right in insert mode" })
keymap.set("i", "<C-h>", "<Right>", { desc = "Move left in insert mode" })

keymap.set(
	"n",
	"<leader>o",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Search And Replace The Word Under The Cursor" }
)

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- dont add to register upon x
keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>w", ":update<Return>", { desc = "[W]rite buffer" })

keymap.set("n", "<leader>q", ":bdelete<Return>", { desc = "[Q]uit buffer" })

vim.keymap.set("n", "<leader>h", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<leader>l", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<leader>j", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<leader>k", "<C-w><C-k>", { desc = "Move focus to the upper window" })
