return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main", -- явно указываем новую ветку
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
			"windwp/nvim-ts-autotag",
		},
		init = function()
			-- 1. Установка парсеров (аналог ensure_installed)
			local ensureInstalled = {
				"regex",
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"prisma",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
			}
			local alreadyInstalled = require("nvim-treesitter.config").get_installed()
			local toInstall = vim.iter(ensureInstalled)
				:filter(function(p)
					return not vim.tbl_contains(alreadyInstalled, p)
				end)
				:totable()
			if #toInstall > 0 then
				require("nvim-treesitter").install(toInstall)
			end

			-- 2. Подсветка и отступы через FileType autocmd
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					pcall(vim.treesitter.start) -- подсветка синтаксиса
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
		opts = {
			-- incremental_selection остаётся здесь
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		},
	},
}
