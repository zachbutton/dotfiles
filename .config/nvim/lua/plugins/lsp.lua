return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    -- configured in after/plugin/treesitter.lua
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- ensures parsers are updated
    branch = "master",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "typescript", -- Add this line for TypeScript support
      },
      highlight = {
        enable = true, -- enables treesitter highlighting
      },
      -- additional treesitter settings can go here
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  { "neovim/nvim-lspconfig" },

  {
    "mason-org/mason.nvim",
    opts = {}
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
  },

  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    opts = {},
  },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  }
}
