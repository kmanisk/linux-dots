-- ================================================================================================
-- TITLE: NeoVim keymaps
-- ABOUT: sets some quality-of-life keymaps
-- ================================================================================================

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Spell Check "Wizard" Mode
-- Press <leader>z to jump to the next error and open the suggestion list instantly
vim.keymap.set("n", "<leader>z", "]sz=", { desc = "Next Spell Suggestion" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", "<Cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", "<Cmd>vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<Cmd>split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Quick config editing
vim.keymap.set("n", "<leader>rc", "<Cmd>e ~/.config/nvim/init.lua<CR>", { desc = "Edit config" })

-- File Explorer
vim.keymap.set("n", "<leader>m", "<Cmd>NvimTreeFocus<CR>", { desc = "Focus on File Explorer" })
vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

-- Toggle Color Hightlighter
vim.keymap.set("n", "<leader>hc", "<cmd>HighlightColorsToggle<CR>", { desc = "Toggle highlight colors" })

-- lua/config/keymaps.lua (add somewhere inside)
-- manual completion trigger (insert mode)
local map = vim.keymap.set
-- Yank to system clipboard for any 'y' and '<Leader>d' mappings
map("v", "y", '"+y', opts) -- Visual mode yank to clipboard
map("n", "yy", '"+yy', opts) -- Normal mode double 'yy' to clipboard
map("n", "p", '"+p', opts) -- Paste from system clipboard
-- map("v", "<leader>y", '"+y', opts) -- Yank with <Leader> to clipboard
map("v", "p", '"+p', opts) -- Paste from clipboard in visual mode

-- Special handling for paste operations with specific behavior
map("n", "gp", 'o<Esc>"+p', opts) -- Paste in new line after cursor
map("n", "gP", 'O<Esc>"+P', opts) -- Paste in new line before cursor

-- Prevent content from being placed in clipboard when deleting, use black hole register
map("n", "d", '"_d', opts) -- Delete in normal mode without affecting clipboard
map("n", "dd", '"_dd', opts) -- Delete whole line without clipboard
map("v", "d", '"_d', opts) -- Delete in visual mode without clipboard
map("v", "D", '"_D', opts) -- Delete to the end of line without clipboard

-- Map <Leader>d to yank to system clipboard
map("n", "<Leader>d", '"+y', opts) -- Leader+d for system clipboard
map("v", "<Leader>d", '"+y', opts) -- Leader+d for system clipboard in visual mode

-- Replace paste with black hole register (paste the last delete)
map("v", "p", '"_dP', opts) -- Replace paste with black hole register

-- Select all content in normal mode
map("n", "<leader>sa", "ggVG", opts) -- Select all

-- Delete all content and store in black hole register
map("n", "<leader>da", 'ggVG"_d', opts) -- Delete all and store in black hole register

-- Yank all content to system clipboard
map("n", "<leader>ya", 'ggVG"+y', opts) -- Yank all to system clipboard

-- Source the current file using <leader>sf
map("n", "<leader>sf", ":source %<CR>", opts)

-- Create a new line below and return to normal mode
map("n", "<leader>n", "o<Esc>", opts)

-- Create a new line above and return to normal mode
map("n", "<leader>N", "O<Esc>", opts)

-- Map 'n' to search forward and center the result on the screen
map("n", "n", "nzz", opts)

-- Map 'N' to search backward and center the result on the screen
map("n", "N", "Nzz", opts)
-- map("n", "b", "ggVG", opts)
-- vim.cmd("highlight Search ctermbg=235 ctermfg=214 guibg=#dcdcdc guifg=#e1c16e")

-- Harpoon
---- Add the current file to Harpoon
-- map("n", "<leader>ha", require("harpoon.mark").add_file, { desc = "Add file to Harpoon" })
--
-- -- Toggle the Harpoon quick menu
-- map("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu, { desc = "Toggle Harpoon menu" })
-- local harpoon_ui = require("harpoon.ui")
--
-- for i = 1, 9 do
--   map("n", "<leader>h" .. i, function()
--     harpoon_ui.nav_file(i)
--   end, { desc = "Navigate to Harpoon file " .. i })
-- end
-- map({ "n", "x" }, "<leader>sr", function()
-- 	require("ssr").open()
-- end)
--
-- Mapping leader tt to open a new tab
map("n", "<leader>tt", ":tabnew<CR>", opts)

-- Mapping Ctrl+m to paste from the system clipboard in insert mode
map("i", "<C-m>", "<C-R>+", opts)

map("n", "gg", "ggzz", opts)
map("n", "G", "Gzz", opts)

-- mapping with a lua function
-- map("n", "<A-i>", function()
--     -- do something
-- end, { desc = "Terminal toggle floating" })

--
map("n", "<Leader><Tab>", ":qa!<CR>", { noremap = true, silent = true, desc = "Force quit Neovim" })

-- Move focus between panes
map("n", "<C-h>", "<C-w>h", { desc = "Move focus to the left pane" })
map("n", "<C-j>", "<C-w>j", { desc = "Move focus to the bottom pane" })
map("n", "<C-k>", "<C-w>k", { desc = "Move focus to the top pane" })
map("n", "<C-l>", "<C-w>l", { desc = "Move focus to the right pane" })

-- Close the current tab with Ctrl+w
map("n", "<C-w>", ":tabclose<CR>", { desc = "Close current tab" })

-- Save current file with Leader+w
map("n", "<Leader>w", ":w<CR>", opts)

-- Save all files with Leader+W
map("n", "<Leader>W", ":wa<CR>", { desc = "Save all files in a buffer" })

-- Remove trailing semicolons and commas, and append semicolons and commas at the end
map("n", "<leader>d;", ":s/;$//<CR>", { noremap = true, silent = true, desc = "Remove trailing semicolons" })
map("n", "<leader>d,", ":s/,$//<CR>", { noremap = true, silent = true, desc = "Remove trailing commas" })
map("n", "<leader>;", "mzA;<Esc>`z", { noremap = true, silent = true, desc = "Append semicolon at the end" })
map("n", "<leader>,", "mzA,<Esc>`z", { noremap = true, silent = true, desc = "Append comma at the end" })

-- Map Ctrl+d to scroll down with centering
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })

-- Map Ctrl+u to scroll up with centering
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
map("i","jk","<Esc>",{desc="Escape insert to normal mode "})
