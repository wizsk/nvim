require("wizsk.set")
require("wizsk.remap")
require("wizsk.lazy")
require("wizsk.plugins.treesitter")
require("wizsk.plugins.mason")
require("wizsk.plugins.telescope")
require("wizsk.plugins.lsp")
require("wizsk.plugins.zenmode")
require("wizsk.plugins.harpoon")
require("wizsk.plugins.undotree")

local augroup = vim.api.nvim_create_augroup
local wizskGroup = augroup('wizskGroup', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

-- reload suff
-- pore dehum ni kita kore
function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = wizskGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

