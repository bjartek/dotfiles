-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

--[[
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.cadence = {
  install_info = {
    url = "~/dev/cadence-tree-sitter", -- local path or git repo
    files = { "src/parser.c" },
  },
  filetype = "cdc", -- if filetype does not agrees with parser name
}
--]]
