return
{
    "chrisgrieser/nvim-spider",
    keys = {
        { -- example for lazy-loading on keystroke
            "e",
            "<cmd>lua require('spider').motion('e')<CR>",
            mode = { "n", "o", "x" },
        },
        {
            "w",
            "<cmd>lua require('spider').motion('w')<CR>",
            mode = { "n", "o", "x" },
        },
        {
            "b",
            "<cmd>lue require('spider').motion('b')<CR>",
            mode = { "n", "o", "x" },
        }

    },
}
