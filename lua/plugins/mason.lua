-- Mason
return {
	"williamboman/mason.nvim",
	priority = 500,
	config = function()
		require("mason").setup {
			ui = {
				icons = {
					package_installed = "✅",
					package_pending = "🔃",
					package_uninstalled = "❌"
				},
			}
		}
	end
}
