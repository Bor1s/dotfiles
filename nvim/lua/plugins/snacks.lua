return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      dashboard = { enabled = false },
      bigfile = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      terminal = { enabled = true },
    },
    init = function()
      -- Snacks is shit. By disabling its weird dashboard it automatically
      -- disables statusline. So I have to enable it manually.
      vim.o.laststatus = 2
    end,
  },
}
