-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

--local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
--parser_config.cadence = {
--  install_info = {
--    url = "~/dev/cadence-tree-sitter", -- local path or git repo
--    files = { "src/parser.c" },
--  },
--  filetype = "cdc", -- if filetype does not agrees with parser name
--}
--

--[[
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go" },
  callback = function()
    vim.lsp.buf.formatting_sync(nil, 3000)
  end,
})
--]]

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go" },
  callback = function()
    local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding(0))
    params.context = { only = { "source.organizeImports" } }

    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding(0))
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
  end,
})
