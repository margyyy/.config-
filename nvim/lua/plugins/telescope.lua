return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
    },
    keys = {
        {
            "<leader>ff",
            "<cmd>Telescope find_files hidden=true<cr>",
            desc = "Cerca file",
        },
        {
            "<leader>fg",
            "<cmd>Telescope live_grep<cr>",
            desc = "Cerca testo",
        },
        {
            "<leader>fb",
            "<cmd>Telescope buffers<cr>",
            desc = "Cerca buffer",
        },
        {
            "<leader>fc",
            "<cmd>Telescope commands<cr>",
            desc = "Cerca comandi",
        },
        {
            "<leader>fh",
            "<cmd>Telescope help_tags<cr>",
            desc = "Cerca nella guida",
        },
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        preview_width = 0.55,
                    },
                },
                sorting_strategy = "ascending",
                prompt_prefix = "  ",
                selection_caret = "  ",
            },
        })

        telescope.load_extension("fzf")
    end

}
