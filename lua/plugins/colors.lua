return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require('rose-pine').setup({
				variant = "moon",
				disable_background = true,
				styles = {
					italic = true,
				},
			})

			vim.cmd.colorscheme("rose-pine-moon")
			vim.cmd.hi("Comment gui=none")
		end
	},
}
