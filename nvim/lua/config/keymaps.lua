-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- dont add to register upon x
keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>w", ":update<Return>", opts)

-- keymap.set("i", "<C-L>", "<Right>", { desc = "Move right in insert mode" })
-- keymap.set("i", "<C-H>", "<Left>", { desc = "Move left in insert mode" })

-- LazyVim remaps
keymap.del("n", "<leader>qq")
keymap.set("n", "<leader>Qq", ":qa<Return>", { desc = "[Q]uit [A]ll" })
keymap.set("n", "<leader>q", ":bdelete<Return>", { desc = "[Q]uit buffer" })

keymap.del("n", "<leader>wd")
keymap.set("n", "<leader>Wd", "<C-W>c", { desc = "Delete Window", remap = true })
keymap.del("n", "<leader>wm")
LazyVim.toggle.map("<leader>Wm", LazyVim.toggle.maximize)

keymap.set(
  "n",
  "<leader>o",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Search And Replace The Word Under The Cursor" }
)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "Q", "<nop>")

-- vim.keymap.set("n", "<leader>ge", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")
