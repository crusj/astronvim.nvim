local SymbolKind = vim.lsp.protocol.SymbolKind;

return {
        'Wansmer/symbol-usage.nvim',
        event = 'BufReadPre', -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
        config = function()
            require('symbol-usage').setup({
                vt_position = 'end_of_line',
                kinds = {SymbolKind.Function, SymbolKind.Method, SymbolKind.Struct, SymbolKind.Interface, SymbolKind.Field, SymbolKind.Constant,  SymbolKind.Enum},
                implementation = {enabled = true},

            })
        end
}
