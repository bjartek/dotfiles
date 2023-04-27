return {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup()
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
},
-- add language parsers
{
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "go",
      "gomod",
      "gowork",
    })
  end,
},
-- mason
{
  "williamboman/mason.nvim",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "gopls",
      "goimports",
      "golangci-lint",
      "golangci-lint-langserver", -- Wraps golangci-lint as a language server
      "delve",
    })
  end,
},
-- lspconfig
{
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    -- server cmdline will be automatically installed with mason and loaded with lspconfig
    ---@type lspconfig.options
    servers = {
      gopls = {},
      golangci_lint_ls = {}, -- linter
    },
  },
},
-- setup formatters & linters
{
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  dependencies = { "mason.nvim" },
  opts = function(_, opts)
    local nls = require("null-ls")
    vim.list_extend(opts.sources, {
      nls.builtins.formatting.goimports,
    })
  end,
}
