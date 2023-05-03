return {
  --load in syntax file
  "bjartek/nvim-cadence",
  config = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.cdc" },
      command = ":normal gg=G''",
    })
    -- startup the cadence shared lspconfig
    require("lspconfig").cadence.setup({
      init_options = {
        accessCheckMode = "none",
      },
    })
  end,
}
