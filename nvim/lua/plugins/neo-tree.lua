return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },

    keys = {
      {
        "<C-e>",
        "<cmd>Neotree toggle<cr>",
        desc = "Apri/chiudi file explorer",
      },
    },

    opts = {
      close_if_last_window = true,

      filesystem = {
        follow_current_file = {
          enabled = true,
        },

        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },

      window = {
        position = "left",
        width = 32,
      },
    },
  },
}
