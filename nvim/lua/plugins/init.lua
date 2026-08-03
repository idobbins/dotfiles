return {
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "light"
      require("ayu").setup({})
      vim.cmd.colorscheme("ayu-light")
    end,
  },

  {
    "dmtrKovalenko/fff.nvim",
    build = function()
      require("fff.download").download_or_build_binary()
    end,
    lazy = false,
    keys = {
      { "<leader>ff", function() require("fff").find_files() end, desc = "Find files" },
      { "<leader>fg", function() require("fff").live_grep() end, desc = "Live grep" },
      {
        "<leader>fw",
        function() require("fff").live_grep_under_cursor() end,
        mode = { "n", "x" },
        desc = "Search word or selection",
      },
    },
    opts = {},
  },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      sync_install = true,
      ensure_installed = {
        "bash",
        "javascript",
        "lua",
        "nix",
        "python",
        "rust",
        "tsx",
        "typescript",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      keymap = { preset = "default" },
      completion = { documentation = { auto_show = true, auto_show_delay_ms = 300 } },
      fuzzy = { implementation = "lua" },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      { "mason-org/mason.nvim", opts = {} },
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local servers = {
        bashls = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            },
          },
        },
        ts_ls = {},
        pyright = {},
        rust_analyzer = {},
      }

      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
        automatic_enable = false,
      })

      for name, config in pairs(servers) do
        config.capabilities = capabilities
        vim.lsp.config(name, config)
        vim.lsp.enable(name)
      end
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
}
