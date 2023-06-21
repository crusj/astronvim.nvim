-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local fn = require("user.fn");

return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["zf"] = { "<cmd>?^func<cr>", desc = "Goto func head" },
    ["\\"] = false,

    -- hop
    ["fww"] = { "<cmd>HopWord<cr>" },
    ["fwl"] = { "<cmd>HopWordCurrentLine<cr>" },
    ["fwj"] = { "<cmd>HopWordAC<cr>" },
    ["fwk"] = { "<cmd>HopWordBC<cr>" },
    ["fll"] = { "<cmd>HopLine>" },
    ["flk"] = { "<cmd>HopLineBC<cr>" },
    ["flj"] = { "<cmd>HopLineAC<cr>" },
    ["flm"] = { "<cmd>HopLineMW<cr>" },
    ["fcl"] = { "<cmd>HopChar1CurrentLine<cr>" },
    ["fcc"] = { "<cmd>HopChar1<cr>" },
    ["fcj"] = { "<cmd>HopChar1AC<cr>" },
    ["fck"] = { "<cmd>HopChar1BC<cr>" },


    -- terminal
    ["\\a"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
    ["\\e"] = { "<cmd>b#<cr>", desc = "Jump between files" },


    -- buffer selected
    ["<leader>j"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    ["<leader>k"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer"
    },

    -- dig
    ["<leader>lk"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Goto Previous diagnostic" },
    ["<leader>lj"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Goto Next diagnostic" },

    --
    ["gM"] = { function() fn.copy_last_git_msg() end, desc = "Copy git" },

    -- wiki
    ["\\ww"] = { "<cmd>VimwikiIndex<cr>", desc = "vim wiki index" },
    ["\\wt"] = { "<cmd>VimwikiTabIndex<cr>", desc = "vim wiki tab index" },

    -- window
    ["c-j"] = { "<cmd>wincmd j<cr>", desc = "window down" },
    ["c-k"] = { "<cmd>wincmd k<cr>", desc = "window up" },
    ["c-l"] = { "<cmd>wincmd l<cr>", desc = "window right" },
    ["c-h"] = { "<cmd>wincmd h<cr>", desc = "window left" },


  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["\\a"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" }
  },

  i = {
    ["\\a"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" }
  }
}
