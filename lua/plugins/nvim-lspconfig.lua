return {
  "neovim/nvim-lspconfig",
  lazy = true,
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf",                                config = true },
    { "folke/neodev.nvim",  opts = { experimental = { pathStrict = true } } },
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    { "towolf/vim-helm", ft = "helm" }, -- To detect Helm files and prevent yamlls from being used
  },
  config = function()
    require("lspconfig").lua_ls.setup({
      diagnostics = {
        underline = true,
        update_in_insert = true,
        virtual_text = {
          spacing = 8,
          source = "if_many",
          prefix = "●",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
        severity_sort = true,
      },
      servers = {
        sumneko_lua = {},
      },
      autoformat = true,
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
    })

    require("lspconfig").astro.setup({})
    require("lspconfig").tailwindcss.setup({})
    require("lspconfig").ts_ls.setup({}) -- TypeScript
    require("lspconfig").rust_analyzer.setup({})
    -- require("lspconfig").astro.setup({})
    require("lspconfig").jedi_language_server.setup({}) -- Python
    -- require("lspconfig").jdtls.setup({})                -- Java
    require("lspconfig").terraformls.setup({})          -- Terraform
    require("lspconfig").nixd.setup({
      cmd = { "nixd" },
      settings = {
        -- More info: https://github.com/nix-community/nixd/blob/main/nixd/docs/configuration.md#configuration-overview
        nixd = {
          nixpkgs = {
            expr = "import <nixpkgs> { }",
            -- expr = 'import (builtins.getFlake ("github:xamcost/nixos-config").inputs.nixpkgs)',
          },
          formatting = {
            command = { "nixpkgs-fmt" },
          },
          options = {
            -- nixos = {
            --   expr = '(builtins.getFlake ("github:xamcost/nixos-config")).nixosConfigurations.elysium.options',
            -- },
            home_manager = {
              expr =
              '(builtins.getFlake ("github:xamcost/nixos-config")).homeConfigurations."mcostalonga@xam-mac-work".options',
            },
          },
        },
      },
    })
    require("lspconfig").yamlls.setup({})
    require("lspconfig").helm_ls.setup({
      settings = {
        ['helm-ls'] = {
          yamlls = {
            path = "yaml-language-server",
          }
        }
      }
    })
  end,
}
