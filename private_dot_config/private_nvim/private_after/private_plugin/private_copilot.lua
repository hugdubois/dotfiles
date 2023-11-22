vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<Right>", 'copilot#Accept("<Right>")', { silent = true, expr = true })
vim.keymap.set("i", "<C-Right>", 'copilot#Suggest()', { silent = true, expr = true })
vim.keymap.set("i", "<C-Down>", 'copilot#Next()', { silent = true, expr = true })
vim.keymap.set("i", "<C-Up>", 'copilot#Previous()', { silent = true, expr = true })
vim.keymap.set("i", "<M-Right>", 'copilot#Suggest()', { silent = true, expr = true })
vim.keymap.set("i", "<M-Down>", 'copilot#Next()', { silent = true, expr = true })
vim.keymap.set("i", "<M-Up>", 'copilot#Previous()', { silent = true, expr = true })
