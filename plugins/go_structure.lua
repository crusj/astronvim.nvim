return {
	'crusj/structrue-go.nvim',
	branch = "main",
	keys = { "<Space>m" },
	ft = "go",
    config = function()
        require("structrue-go").setup({
            show_filename = false,
            position = "float",
            keymaps = {
                toggle = "<Space>m"
            },
            symbol = {
                filename = {
		            hl = "guifg=#0096C7", -- highlight symbol
		            icon = " " -- symbol icon
		        },
		        package = {
		            hl = "guifg=#0096C7",
		            icon = " "
		        },
		        import = {
		            hl = "guifg=#0096C7",
		            icon = " ◈ "
		        },
		        const = {
		            hl = "guifg=#E44755",
		            icon = " π ",
		        },
		        variable = {
		            hl = "guifg=#52A5A2",
		            icon = " ◈ ",
		        },
		        func = {
		            hl = "guifg=#CEB996",
		            icon = "  ",
		        },
		        interface = {
		            hl = "guifg=#00B4D8",
		            icon = "❙ "
		        },
		        type = {
		            hl = "guifg=#00B4D8",
		            icon = "▱ ",
		        },
		        struct = {
		            hl = "guifg=#00B4D8",
		            icon = "❏ ",
		        },
		        field = {
		            hl = "guifg=#CEB996",
		            icon = " ▪ "
		        },
		        method_current = {
		            hl = "guifg=#CEB996",
		            icon = " ƒ "
		        },
		        method_others = {
		            hl = "guifg=#CEB996",
		            icon = "  "
		        },
                    }
                })
    end
}
