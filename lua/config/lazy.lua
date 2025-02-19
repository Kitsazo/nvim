local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "plugins", },

	-- Telescope UI Select
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			local telescope = require("telescope")
			local themes = require("telescope.themes")
			--
			telescope.setup {
				extensions = {
					["ui-select"] = {
						themes.get_dropdown {}
					}
				}
			}
			--
			telescope.load_extension("ui-select")
		end
	},

	-- Auto Complete
	{
		'saghen/blink.cmp',
		dependencies = 'rafamadriz/friendly-snippets',

		version = '*',

		opts = {
			keymap = { preset = 'super-tab' },

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = 'mono'
			},

			signature = { enabled = true }
		},
	},

	-- Vim Fugitive
	{ "tpope/vim-fugitive" },

	-- Icons
	{ 'echasnovski/mini.icons', version = '*', priority = 999 },

	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	}

})
