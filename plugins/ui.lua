if vim.g.neovide then
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_transparency = 1.0
    vim.g.neovide_cursor_vfx_mode = "sonicboom"
    vim.o.guifont = "Hack Nerd Font Mono:h15"

    vim.g.neovide_floating_shadow = false
    vim.g.neovide_floating_z_height = 10
    vim.g.neovide_light_angle_degrees = 45
    vim.g.neovide_light_radius = 5
    vim.g.neovide_scroll_animation_far_lines = 1
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
