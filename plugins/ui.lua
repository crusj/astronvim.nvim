vim.g.neovide_remember_window_size = true
vim.g.neovide_transparency = 0.95
vim.g.neovide_cursor_vfx_mode = "sonicboom"



return {
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "User AstroFile",
        main = "ibl",
        opts = {
        },
    },
}
