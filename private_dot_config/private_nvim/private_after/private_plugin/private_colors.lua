-- dracula
-- require('dracula').setup({
--     disable_background = true
-- })
--
-- function ColorMyPencils(color)
-- 	-- color = color or "rose-pine"
-- 	color = color or "dracula"
-- 	vim.cmd.colorscheme(color)
--
-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end
--
-- ColorMyPencils()
--
-- Gruvbox
require("gruvbox").setup({
  transparent_mode = true,
})
vim.cmd("colorscheme gruvbox")
