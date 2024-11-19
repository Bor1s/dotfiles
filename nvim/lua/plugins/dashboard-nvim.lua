return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        theme = "hyper",
        config = {
          week_header = {
            enable = true,
          },
          project = { enable = false },
          mru = { limit = 3, cwd_only = false },
          shortcut = {
            {
              action = "ene",
              desc = " New file",
              icon = " ",
              key = "n",
            },
            {
              action = [[lua require("lazyvim.util").telescope.config_files()()]],
              desc = " Config",
              icon = " ",
              key = "c",
            },
            {
              action = "LazyExtras",
              desc = " Lazy Extras",
              icon = " ",
              key = "x",
            },
            {
              action = "Lazy",
              desc = " Lazy",
              icon = "󰒲 ",
              key = "l",
            },
            {
              action = "qa",
              desc = " Quit",
              icon = " ",
              key = "q",
            },
          },
        },
      })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
}
