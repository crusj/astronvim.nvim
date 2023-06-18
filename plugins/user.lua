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
            vim.keymap.set('i', '<c-o>', function() return vim.fn['codeium#Accept']() end, { expr = true })
            vim.keymap.set('i', '<c-j>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
            vim.keymap.set('i', '<c-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
            vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
        end
    },

    {
        'akinsho/git-conflict.nvim',
        lazy = false,
        version = "*",
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
        'p00f/nvim-ts-rainbow',
        event = 'User AstroFile',
        lazy = false,
    },

    {
        "vimwiki/vimwiki",
        event = "BufEnter *.wiki",
        keys = {
            { "\\ww", mode = { "n" } },
        },
    },

    {
        'crusj/bookmarks.nvim',
        keys = {
            { "<tab><tab>", mode = { "n" } },
        },
        branch = 'main',
        dependencies = { 'nvim-web-devicons' },
        config = function()
            require("bookmarks").setup()
            require("telescope").load_extension("bookmarks")
        end
    }

}
