return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		--"hrsh7th/cmp-cmdline",a
		"hrsh7th/vim-vsnip",
		"hrsh7th/vim-vsnip-integ",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
		{
			"onsails/lspkind.nvim",
			config = function()
				--local lspkind = require("lspkind")
			end,
		},
		{
			"dsznajder/vscode-es7-javascript-react-snippets",
			build = "yarn install --frozen-lockfile && yarn compile",
		},
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				-- LuaSnip key bindings
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				--{ name = "vsnip" }, -- For vsnip users.
				--{ name = "luasnip", option = { use_show_condition = false } }, -- For luasnip users.
			}, {
				{ name = "buffer" },
			}),
			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = lspkind.cmp_format({
					mode = "symbol", -- show only symbol annotations
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
