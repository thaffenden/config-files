-- Alt + num goes to tab number
local alt_num_goes_to_tab = function(num)
  vim.api.nvim_set_keymap("n", "<M-"..num..">", num.."gt", { unique = true })
end

alt_num_goes_to_tab(1)
alt_num_goes_to_tab(2)
alt_num_goes_to_tab(3)
alt_num_goes_to_tab(4)
alt_num_goes_to_tab(5)
alt_num_goes_to_tab(6)
alt_num_goes_to_tab(7)
alt_num_goes_to_tab(8)
alt_num_goes_to_tab(9)

-- Better window movement
local ctrl_hjkl_to_move = function(char)
  vim.api.nvim_set_keymap("n", "<C-"..char..">", "<C-w>"..char, { silent = true })
end

ctrl_hjkl_to_move("h")
ctrl_hjkl_to_move("j")
ctrl_hjkl_to_move("k")
ctrl_hjkl_to_move("l")
ctrl_hjkl_to_move("t")

-- Better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', { noremap = true, silent = true })
