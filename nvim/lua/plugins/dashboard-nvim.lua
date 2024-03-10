return {
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      opts.theme = "hyper"
      opts.config.week_header = {
        enable = true,
      }

      opts.config.project = { enable = false }
      opts.config.mru = { limit = 3, cwd_only = false }

      opts.config.shortcut = {
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
      }
    end,
  },
}
