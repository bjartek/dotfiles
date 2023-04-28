-- adapted from https://github.com/amaanq/nvim-config/blob/master/lua/plugins/extras/lang/go.lua
-- adapted from https://github.com/ueaner/nvimrc/blob/main/lua/plugins/extras/lang/example.lua
return  --[[
{
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
--]]{
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = true,
  event = "CmdlineEnter",
  ft = { "go", "gomod", "gosum", "gowork" },
},
-- Add gopher.nvim
{
  "olexsmir/gopher.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
  config = true,
},
-- add language parsers
{
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "go",
      "gomod",
      "gowork",
      "gosum",
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
      "goimports-reviser",
      "delve",
    })
  end,
},
-- Correctly setup lspconfig for Go 🚀
{
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- Ensure mason installs the server
      golangci_lint_ls = {},
      gopls = {},
    },
    setup = {
      gopls = function(_, opts)
        require("lazyvim.util").on_attach(function(client, _)
          if client.name == "gopls" then
            -- workaround for gopls not supporting semanticTokensProvider
            -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
            if not client.server_capabilities.semanticTokensProvider then
              local semanticTokens = client.config.capabilities.textDocument.semanticTokens
              client.server_capabilities.semanticTokensProvider = {
                full = true,
                legend = {
                  tokenTypes = semanticTokens.tokenTypes,
                  tokenModifiers = semanticTokens.tokenModifiers,
                },
                range = true,
              }
            end
          end
        end)
        opts.settings = {
          gopls = {
            gofumpt = true,
            codelenses = {
              gc_details = false,
              generate = true,
              regenerate_cgo = true,
              run_govulncheck = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            analyses = {
              fieldalignment = true,
              nilness = true,
              unusedparams = true,
              unusedwrite = true,
              useany = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            semanticTokens = true,
          },
        }
      end,
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
