-- Telescope
return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },

        keys = function()
            return {
                { "<leader>th", "<cmd> Telescope help_tags<cr>",  desc = "Get Help." },
                { "<leader>td", "<cmd> Telescope find_files<cr>", desc = "Find Files in Whole Directory." },
                { "<leader>tf", "<cmd> Telescope git_files<cr>",  desc = "Find Files, Includes Only Git Files." },
                {
                    "<leader>tc",
                    function()
                        require("telescope.builtin").find_files {
                            cwd = vim.fn.stdpath("config")
                        }
                    end,
                    desc = "Find Files in Config."
                },
                {
                    "<leader>tg",
                    function()
                        require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
                    end,
                    desc = "Search Using Grep.",
                },
            }
        end,
    },
}

