return {
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "User AstroFile",
        opts = {
            buftype_exclude = {
                "nofile",
                "terminal",
            },
            filetype_exclude = {
                "help",
                "startify",
                "aerial",
                "alpha",
                "dashboard",
                "lazy",
                "neogitstatus",
                "NvimTree",
                "neo-tree",
                "Trouble",
            },
            context_patterns = {
                'class', '^func', 'method', '^if', '^const', 'while', 'for', 'with', 'try', 'except', 'match',
                'arguments',
                'argument_list', 'object', 'dictionary', 'element', 'table', 'tuple', 'do_block', "type", "import",
                "return", "literal_value"
            },
            show_trailing_blankline_indent = true,
            use_treesitter = true,
            char = "▏",
            context_char = "▏",
            show_current_context = true,
        },
    },
}
