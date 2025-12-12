-- Set <leader> to Space (so all <leader> mappings start with Space)
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- <leader>pv: open Netrw file explorer (Ex command) in the current window

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- VISUAL: moves the selected block DOWN and auto-indents it
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- VISUAL: moves the selected block UP and auto-indents it

vim.keymap.set("n", "J", "mzJ`z")         -- NORMAL: J normally joins lines and moves the cursor; this version keeps your cursor position
vim.keymap.set("n", "<C-d>", "<C-d>zz")   -- NORMAL: half-page down, then center the cursor line in the window (zz)
vim.keymap.set("n", "<C-u>", "<C-u>zz")   -- NORMAL: half-page up, then center the cursor line in the window (zz)
vim.keymap.set("n", "n", "nzzzv")         -- NORMAL: next search result, then center it and open folds around it (zzzv)
vim.keymap.set("n", "N", "Nzzzv")         -- NORMAL: previous search result, then center it and open folds around it (zzzv)
vim.keymap.set("n", "=ap", "ma=ap'a")     -- NORMAL: format “a paragraph” (=ap) but preserve your cursor position by marking it with 'a' first

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]]) -- VISUAL (x): paste over selection without yanking the replaced text:

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])  -- NORMAL+VISUAL: <leader>y yank to the system clipboard (+ register)
vim.keymap.set("n", "<leader>Y", [["+Y]])           -- NORMAL: <leader>Y yank to the system clipboard (+ register)
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")   -- NORMAL+VISUAL: <leader>d delete into the black-hole register (so it doesn't clobber your yank buffer)

vim.keymap.set("n", "Q", "<nop>") -- NORMAL: disable Ex mode (Q)

-- NORMAL: <leader>s prefill a :%s substitution for the word under cursor:
-- \<<C-r><C-w>\> makes it whole-word; duplicates it for replacement; gI = global + ignorecase.
-- Cursor is positioned before flags so you can tweak the command.
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- NORMAL: <leader>x make current file executable (chmod +x), silent to avoid command noise
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

