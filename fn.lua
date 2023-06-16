local M = {
    git_log_buf = nil,
    git_log_win = nil,
}

-- 关闭最近win
function M.close_last_git_win()
    if M.git_log_win ~= nil and vim.api.nvim_win_is_valid(M.git_log_win) then
        vim.api.nvim_win_close(M.git_log_win, true)
    end
end

-- 选择log
function M.choose_git_log()
    vim.fn.execute("normal! Vy")
    M.close_last_git_win()
end

-- copy 当前项目最近git log body信息
function M.copy_last_git_msg()
    if M.git_log_buf == nil then
        M.git_log_buf = vim.api.nvim_create_buf(false, true)

        -- bind buf keymap
        vim.api.nvim_buf_set_keymap(M.git_log_buf, "n", "<esc>", ":lua require'user.fn'.close_last_git_win()<CR>",
            { silent = true })
        vim.api.nvim_buf_set_keymap(M.git_log_buf, "n", "<cr>", ":lua require'user.fn'.choose_git_log()<CR>",
            { silent = true })
    end

    local lines = {}
    local cmd = "git log -10 --pretty=format:%B"
    vim.fn.jobstart(cmd, {
        on_stdout = function(_, data)
            for _, line in pairs(data) do
                if line ~= "" then
                    lines[#lines + 1] = line
                end
            end
        end,
        on_exit = function()
            -- 计算高度
            local ew = vim.api.nvim_get_option("columns")
            local eh = vim.api.nvim_get_option("lines")
            local gw = math.floor(ew * 0.7)
            local gh = math.floor(eh * 0.7)
            M.git_log_win = vim.api.nvim_open_win(M.git_log_buf, true, {
                relative = "editor",
                width = gw,
                height = gh,
                row = math.floor((eh - gh) / 2),
                col = math.floor((ew - gw) / 2),
                border = "double",
            })

            -- vim.api.nvim_win_set_option(M.git_log_win, "winhighlight", "CursorLine:hl_git_log_csl")
            vim.api.nvim_buf_set_lines(M.git_log_buf, 0, #lines, false, lines)
        end
    })
end

return M
