local utils = require "astronvim.utils"
local maps = require("astronvim.utils").empty_map_table()
return {
	{
		'edolphin-ydf/goimpl.nvim',
		ft = "go",
        keys = { "<space>im" },
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-lua/popup.nvim' },
            { 'nvim-telescope/telescope.nvim' },
        },
        config = function()
            require 'telescope'.load_extension 'goimpl'
            maps.n["<leader>im"] = {"<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<CR>", desc = "[go] goimpl"}
            utils.set_mappings(astronvim.user_opts("mappings", maps))
        end,
	}
}
