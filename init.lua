vim.opt.rtp:append(vim.fn.stdpath("data") .. "/site")
vim.opt.fillchars =  { eob = " " }
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.mouse = "a"
vim.g.markdown_recommended_style = 0

require("core.options")

require("plugins")
