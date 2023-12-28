local utils = require "astronvim.utils"
return {
    {
        'edolphin-ydf/goimpl.nvim',
        keys = {
            { "<space>im", "<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<CR>", desc = "goimpl" }
        },
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-lua/popup.nvim' },
            { 'nvim-telescope/telescope.nvim' },
        },
        config = function()
            require 'telescope'.load_extension 'goimpl'
        end,
    }
}
