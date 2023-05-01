return {
  --load in syntax file
  "bjartek/nvim-cadence",
  config = function()
    -- startup the cadence shared lspconfig
    require("lspconfig").cadence.setup({
      init_options = {
        accessCheckMode = "none",
      },
    })
  end,
}
