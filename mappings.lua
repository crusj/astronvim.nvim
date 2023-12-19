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
    ["fll"] = { "<cmd>HopChar2CurrentLine<cr>" },
    ["flk"] = { "<cmd>HopLineBC<cr>" },
    ["flj"] = { "<cmd>HopLineAC<cr>" },
    ["flm"] = { "<cmd>HopLineMW<cr>" },


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

    ["<C-0>"] = { "<cmd>vertical resize -10<cr>", desc = "Decrease window width" },
    ["<C-9>"] = { "<cmd>vertical resize +10<cr>", desc = "Increase window width" },

    -- telescope
    ["<leader>fw"] = {
      function()
        require("telescope.builtin").live_grep({
          additional_args = function(args)
            return vim.list_extend(args, { "-L" })
          end,
          glob_pattern = {
            "!*.sum"
          }
        })
      end,
      desc = "Find words"
    },
    ["<leader>ff"] = {
      function()
        require("telescope.builtin").find_files({
          follow = true,
        })
      end,
      desc = "Find files"
    },
    ["<C-k>"] = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },

    -- rust
    [" r"] = { "<cmd>RustHoverActions<cr>", desc = "rust hover actions" }


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
