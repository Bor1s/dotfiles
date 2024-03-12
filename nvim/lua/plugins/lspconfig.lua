local lspconfig = require("lspconfig")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Useful for debugging formatter issues
      -- format_notify = true,
      servers = {
        -- rubocop = {
        --   -- See: https://docs.rubocop.org/rubocop/usage/lsp.html
        --   cmd = { "bundle", "exec", "rubocop" },
        --   root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
        -- },
        solargraph = {
          -- See: https://medium.com/@cristianvg/neovim-lsp-your-rbenv-gemset-and-solargraph-8896cb3df453
          cmd = { os.getenv("HOME") .. "/.rbenv/shims/solargraph", "stdio" },
          root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
          settings = {
            solargraph = {
              autoformat = true,
              completion = true,
              diagnostics = true,
              folding = true,
              references = true,
              rename = true,
              symbols = true,
            },
          },
        },
      },
    },
  },
}
