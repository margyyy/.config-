return {
  {
    "saghen/blink.cmp",
    version = "*",

    dependencies = {
      "rafamadriz/friendly-snippets",
    },

    opts = {
      keymap = {
        preset = "default",

        ["<Tab>"] = {
          "select_next",
          "snippet_forward",
          "fallback",
        },

        ["<S-Tab>"] = {
          "select_prev",
          "snippet_backward",
          "fallback",
        },

        ["<CR>"] = {
          "accept",
          "fallback",
        },

        ["<C-Space>"] = {
          "show",
          "show_documentation",
          "hide_documentation",
        },

        ["<C-e>"] = {
          "hide",
          "fallback",
        },
      },

      appearance = {
        nerd_font_variant = "mono",
      },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 300,
        },

        menu = {
          border = "rounded",
        },

        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
      },

      signature = {
        enabled = true,
        window = {
          border = "rounded",
        },
      },

      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
        },
      },

      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },
    },

    opts_extend = {
      "sources.default",
    },
  },
}
