-- Mason Config
return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = { "saghen/blink.cmp", "neovim/nvim-lspconfig", "mason.nvim" },
	--
	config = function()
		local masonLSPConfig = require("mason-lspconfig")

		masonLSPConfig.setup {
			ensure_installed = { "ts_ls", "lua_ls", "luau_lsp" },
			automatic_installation = true,
		}

		local keymap = vim.keymap
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		--
		local on_attach = function(client, bufnr)
			local function bufOptsWithDesc(desc)
				return { silent = true, buffer = bufnr, desc = desc }
			end

			keymap.set("n", "<leader>cf", function()
				vim.lsp.buf.format { async = true }
			end, bufOptsWithDesc 'Format File')

			keymap.set("n", "<leader>cr", vim.lsp.buf.rename, bufOptsWithDesc 'Rename Symbol')
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, bufOptsWithDesc 'See Available Code Actions')
			keymap.set("n", "<leader>cd", vim.lsp.buf.hover, bufOptsWithDesc 'Show Documentation for Symbol')
		end
		--
		vim.api.nvim_create_autocmd('LspAttach', {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id); if not client then return end;

				--@diagnostic disable-next-line: missing-parameter
				if client.supports_method('textDocument/formatting') then
					vim.api.nvim_create_autocmd('BufWritePre', {
						buffer = args.buf,
						callback = function()
							vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
						end,
					})
				end
			end
		})
		--
		masonLSPConfig.setup_handlers {
			-- default handler
			function(server_name)
				local server = require("lspconfig")[server_name]
				server.setup {
					on_attach = on_attach,
					capabilities = capabilities,
				}
			end,

			luau_lsp = function()
				require("luau-lsp").setup {
					on_attach = on_attach,
					capabilities = capabilities,

					plugin = {
						enabled = true,
						port = 3667,
					},
				}
			end
		}
	end
}
