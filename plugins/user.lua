return {
    -- You can also add new plugins here as well:
    -- Add plugins, the lazy syntax
    -- "andweeb/presence.nvim",
    {
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        config = function()
            require("lsp_signature").setup()
        end,
    },
    {
        "neovim/nvim-lspconfig",
        init_options = {
            userLanguages = {
                eelixir = "html-eex",
                eruby = "erb",
                rust = "html",
            },
        },
    },
    {
        'phaazon/hop.nvim',
        lazy = false,
        keys = {
            { "fwl", mode = { "n" } },
            { "fwk", mode = { "n" } },
            { "fwj", mode = { "n" } },
        },
        branch = 'v1', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    },

    {
        "sindrets/diffview.nvim",
        keys = {
            { "\\do", mode = { "n" } },
            { "\\d1", mode = { "n" } },
            { "\\dc", mode = { "n" } },
            { "\\dh", mode = { "n" } }
        },
        config = function()
            require("diffview").setup {}
            vim.keymap.set("n", "\\do", "<cmd>DiffviewOpen<cr>", {})
            vim.keymap.set("n", "\\d1", "<cmd>DiffviewOpen HEAD~1<cr>", {})
            vim.keymap.set("n", "\\dc", "<cmd>DiffviewClose<cr>", {})
            vim.keymap.set("n", "\\dh", "<cmd>DiffviewFileHistory<cr>", {})
        end
    },

    {
        'Exafunction/codeium.vim',
        event = 'InsertEnter',
        config = function()
            -- Change '<C-g>' here to any keycode you like.
            vim.keymap.set('i', '<c-o>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
            vim.keymap.set('i', '<c-j>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
            vim.keymap.set('i', '<c-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
            vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
        end
    },

    {
        'akinsho/git-conflict.nvim',
        version = "1.*",
        config = true,
    },

    {
        'tzachar/highlight-undo.nvim',
        config = function()
            require('highlight-undo').setup({
            })
        end
    },

    {
        'crusj/bookmarks.nvim',
        keys = {
            { "  ", mode = { "n" } },
        },
        branch = 'main',
        dependencies = { 'nvim-web-devicons' },
        config = function()
            require("bookmarks").setup({
                keymap = {
                    toggle = "  ", -- Toggle bookmarks
                    order = "O",
                },
                fix_enable = false,
                preview_ext_enable = true,
                sign_icon = "󰃃",
                width = 0.95,
                virt_pattern = { "*.go", "*.rs", "*.sh", "*.lua", "*.http" }
            })
            require("telescope").load_extension("bookmarks")
            vim.cmd([[
                hi link bookmarks_virt_text Comment
            ]])
        end
    },
    {
        "rest-nvim/rest.nvim",
        ft = "http",
        dependencies = { "plenary.nvim" },
        commit = "8b62563",
        config = function()
            require("rest-nvim").setup({
                -- Open request results in a horizontal split
                result_split_horizontal = true,
                -- Keep the http file buffer above|left when split horizontal|vertical
                result_split_in_place = false,
                -- Skip SSL verification, useful for unknown certificates
                skip_ssl_verification = true,
                -- Encode URL before making request
                encode_url = true,
                -- Highlight request on run
                highlight = {
                    enabled = true,
                    timeout = 150,
                },
                result = {
                    -- toggle showing URL, HTTP info, headers at top the of result window
                    show_url = true,
                    -- show the generated curl command in case you want to launch
                    -- the same request via the terminal (can be verbose)
                    show_curl_command = false,
                    show_http_info = true,
                    show_headers = true,
                    -- executables or functions for formatting response body [optional]
                    -- set them to false if you want to disable them
                    formatters = {
                        json = "jq",
                        html = function(body)
                            return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
                        end
                    },
                },
                -- Jump to request line on run
                jump_to_request = false,
                env_file = '.env',
                custom_dynamic_variables = {},
            })
            vim.keymap.set("n", " rh", "<Plug>RestNvim<cr>", {})
        end
    },
    {
        "simrat39/inlay-hints.nvim",
        lazy = false,
        config = function()
            require("inlay-hints").setup({
                only_current_line = true,
                eol = {
                    right_align = true,
                }
            })
        end
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
    },
    {
        'mvllow/modes.nvim',
        tag = 'v0.2.1',
        dependencies = { 'rebelot/kanagawa.nvim' },
        event = { "ColorScheme" },
        config = function()
            require('modes').setup {
                colors = {
                    copy = "#f5c359",
                    delete = "#c75c6a",
                    insert = "#78ccc5",
                    visual = "#c75c8a",
                },
                line_opacity = 0.1,
            }
        end
    }
}
