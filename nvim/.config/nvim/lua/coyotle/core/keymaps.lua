vim.g.mapleader = " "

local keymap = vim.keymap

-- move line or v-block
keymap.set("i", "<C-j>", "<Esc><cmd>m .+1<CR>==gi")
keymap.set("i", "<C-k>", "<Esc><cmd>m .-2<CR>==gi")
keymap.set("x", "J", ":m '>+1<CR>gv-gv", { noremap = true, silent = true })
keymap.set("x", "K", ":m '<-2<CR>gv-gv", { noremap = true, silent = true })

-- navigate windows
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

keymap.set("n", "<C-down>", "<C-w>j")
keymap.set("n", "<C-left>", "<C-w>h")
keymap.set("n", "<C-up>", "<C-w>k")
keymap.set("n", "<C-right>", "<C-w>l")

-- window management
keymap.set("n", "<leader>wv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>wh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>wx", ":close<CR>") -- close current split window

-- tabs
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- buffers
keymap.set("n", "<leader>bo", ":new<CR>") -- open new buffer
--keymap.set("n", "<leader>bd", ":bdelete<CR>") -- close current buffer
keymap.set("n", "<leader>bd", ":bp<CR>:bd#<CR>") -- close current buffer
keymap.set("n", "<leader>bn", ":bn<CR>") --  go to next buffer
keymap.set("n", "<leader>bp", ":bp<CR>") --  go to previous buffer

-- shift arrow like gui
keymap.set("n", "<S-Up>", "v<Up>")
keymap.set("n", "<S-Down>", "v<Down>")
keymap.set("n", "<S-Left>", "v<Left>")
keymap.set("n", "<S-Right>", "v<Right>")
keymap.set("v", "<S-Up>", "<Up>")
keymap.set("v", "<S-Down>", "<Down>")
keymap.set("v", "<S-Left>", "<Left>")
keymap.set("v", "<S-Right>", "<Right>")
keymap.set("i", "<S-Up>", "<Esc>v<Up>")
keymap.set("i", "<S-Down>", "<Esc>v<Down>")
keymap.set("i", "<S-Left>", "<Esc>v<Left>")
keymap.set("i", "<S-Right>", "<Esc>v<Right>")

-- copy paste like gui
--keymap.set("v", "<C-c>", '"+y<Esc>i')
--keymap.set("v", "<C-x>", '"+d<Esc>i')
--keymap.set("i", "<C-v>", '"+pi')
--keymap.set("i", "<C-v>", '<Esc>"+pi', { noremap = true, silent = true })
--keymap.set("i", "<C-z>", "<Esc>ui", { noremap = true, silent = true })
--keymap.set("i", "<C-z>", "<Esc>ui", { noremap = true, silent = true })
--keymap.set({ "i", "v", "x", "t" }, "<C-a>", "<C-\\><C-n>ggVG", { noremap = true, silent = true })

----------------------
-- Plugin Keybinds
----------------------

keymap.set("n", "\\", ":ToggleTerm<CR>")
keymap.set("t", "<esc>", [[<C-\><C-n>]])
