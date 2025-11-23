return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}
		-- dashboard.section.header.val = {
		-- 	"               .',;::::;,'.               ",
		-- 	"           .';:cccccccccccc:;,.           ",
		-- 	"        .;cccccccccccccccccccccc;.        ",
		-- 	"      .:cccccccccccccccccccccccccc:.      ",
		-- 	"    .;ccccccccccccc;.:███L:.;ccccccc;.    ",
		-- 	"   .:ccccccccccccc;O███████Wd;ccccccc:.   ",
		-- 	"  .:ccccccccccccc;K███════╗█Mc:ccccccc:.  ",
		-- 	"  ,cccccccccccccc;███.;cc;;██::cccccccc,  ",
		-- 	"  :cccccccccccccc║███.;cccccccccccccccc:  ",
		-- 	"  :ccccccc;░▒▓▓▓████████▒▒:;ccccccccccc:  ",
		-- 	"  cccccc:▒▒▓═════╗███═══c.;cccccccccccc;  ",
		-- 	"  cccc:║▒▓M0';ccc║███.;cccccccccccccccc'  ",
		-- 	"  cccc;║▒▓o;ccccc║███.;ccccccccccccccc;   ",
		-- 	"  cccc.╚╗▒▓c.ccc║███d:ccccccccccccccc;    ",
		-- 	"  ccccc.╚╗▓▓█XX║██0::cccccccccccccc:,     ",
		-- 	"  cccccc.╚══╗███:.;cccccccccccccc:,.      ",
		-- 	"  :cccccccc;╚══:ccccccccccccccc:'.        ",
		-- 	"  .:cccccccccccccccccccccc:;,..           ",
		-- 	"    '::cccccccccccccc::;,.                ",
		-- }

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
			dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
			dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
