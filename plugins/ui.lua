if vim.g.neovide then
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_transparency = 1.0
    vim.g.neovide_cursor_vfx_mode = "sonicboom"
end

return {
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "User AstroFile",
        main = "ibl",
        opts = {
        },
    },
}
