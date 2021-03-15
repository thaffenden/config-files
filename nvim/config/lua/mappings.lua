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
