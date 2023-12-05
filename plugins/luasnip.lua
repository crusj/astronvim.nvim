return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	run = "make install_jsregexp",
	config = function()
        local luasnip = require("luasnip")
        local types = require("luasnip.util.types")
        luasnip.config.set_config({
            ext_opts = {
                [types.snippet] = {
                    active = {
                        virt_text = { { '🌈' } },
                        hl_mode = "combine"
                    },
                }
            }
         })
	end
}
