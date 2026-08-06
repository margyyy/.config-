return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "saghen/blink.cmp",
    },

    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      vim.lsp.enable({
        "lua_ls",
        "nil_ls",
        "pyright",
        "clangd",
        "gopls",
        "rust_analyzer",
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local opts = {
            buffer = event.buf,
            silent = true,
          }

          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

          vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({
              async = true,
            })
          end, opts)
        end,
      })
    end,
  },
}
