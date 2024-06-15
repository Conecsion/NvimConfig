return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 100
		end,
		opts = {
			triggers_blacklist = {
				i = { "j", "k" },
				v = { "j", "k" },
			},
			window = {
				border = "single",
				margin = { 0, 0, 0, 0 },
				padding = { 0, 0, 0, 0 },
			},
		},
		config = function()
			require("whichkeysetup")
		end,
	},

	-- {
	-- 	'goolord/alpha-nvim',
	-- 	config = function()
	-- 		require'alpha'.setup(require'alpha.themes.dashboard'.config)
	-- 	end
	-- },
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup(require("custom.dashboard"))
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},

	{
		"phaazon/hop.nvim",
		branch = "v2",
		event = "VeryLazy",
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		-- event = "VeryLazy",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "bash", "query" },
				sync_install = true,
				auto_install = true,
				ignore_install = {},
				disable = function() end,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},

	{
		"williamboman/mason.nvim",
	},

	{
		"williamboman/mason-lspconfig.nvim",
	},

	{
		"neovim/nvim-lspconfig",
	},

	{
		"nvimtools/none-ls.nvim",
		-- event = "VeryLazy",
		config = function()
      require('custom.lsp.null-ls')
		end,
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
	},

	{
		"rcarriga/nvim-notify",
		-- event = "VeryLazy",
		config = function()
      vim.notify = require('notify')
			require("notify").setup({
				level = 1,
			})
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				sort = {
					sorter = "case_sensitive",
				},
			})
		end,
	},

	{
		"numToStr/FTerm.nvim",
		event = "VeryLazy",
		config = function()
			require("FTerm").setup({
				border = "rounded",
			})
		end,
	},

	-- nvim-cmp disc
	{ "hrsh7th/cmp-nvim-lsp", event = "VeryLazy" },
	{ "hrsh7th/cmp-buffer", event = "VeryLazy" },
	{ "hrsh7th/cmp-path", event = "VeryLazy" },
	{ "hrsh7th/cmp-cmdline", event = "VeryLazy" },
	{ "hrsh7th/nvim-cmp", event = "VeryLazy" },
	{ "L3MON4D3/LuaSnip", event = "VeryLazy" },
	{ "saadparwaiz1/cmp_luasnip", event = "VeryLazy" },
	{
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require('nvim-autopairs').setup {}
      local npairs = require'nvim-autopairs'
      local Rule = require'nvim-autopairs.rule'
      local cond = require 'nvim-autopairs.conds'

      local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
      npairs.add_rules {
        -- Rule for a pair with left-side ' ' and right side ' '
        Rule(' ', ' ')
          -- Pair will only occur if the conditional function returns true
          :with_pair(function(opts)
            -- We are checking if we are inserting a space in (), [], or {}
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({
              brackets[1][1] .. brackets[1][2],
              brackets[2][1] .. brackets[2][2],
              brackets[3][1] .. brackets[3][2]
            }, pair)
          end)
          :with_move(cond.none())
          :with_cr(cond.none())
          -- We only want to delete the pair of spaces when the cursor is as such: ( | )
          :with_del(function(opts)
            local col = vim.api.nvim_win_get_cursor(0)[2]
            local context = opts.line:sub(col - 1, col + 2)
            return vim.tbl_contains({
              brackets[1][1] .. '  ' .. brackets[1][2],
              brackets[2][1] .. '  ' .. brackets[2][2],
              brackets[3][1] .. '  ' .. brackets[3][2]
            }, context)
          end)
      }
      -- For each pair of brackets we will add another rule
      for _, bracket in pairs(brackets) do
        npairs.add_rules {
          -- Each of these rules is for a pair with left-side '( ' and right-side ' )' for each bracket type
          Rule(bracket[1] .. ' ', ' ' .. bracket[2])
            :with_pair(cond.none())
            :with_move(function(opts) return opts.char == bracket[2] end)
            :with_del(cond.none())
            :use_key(bracket[2])
            -- Removes the trailing whitespace that can occur without this
            :replace_map_cr(function(_) return '<C-c>2xi<CR><C-c>O' end)
        }
      end
    end
  },

	{ "nvim-lua/popup.nvim" },

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		-- event = 'VeryLazy',
		config = function()
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}

			local hooks = require("ibl.hooks")
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			end)

			require("ibl").setup({ indent = { highlight = highlight } })
			require("ibl").overwrite({
				exclude = { filetypes = { "dashboard" } },
			})
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
      -- Bubbles config for lualine
      -- Author: lokesh-krishna
      -- MIT license, see LICENSE for more details.

      -- stylua: ignore
      local colors = {
        blue   = '#80a0ff',
        cyan   = '#79dac8',
        black  = '#080808',
        white  = '#c6c6c6',
        red    = '#ff5189',
        violet = '#d183e8',
        grey   = '#303030',
      }

			local bubbles_theme = {
				normal = {
					a = { fg = colors.black, bg = colors.violet },
					b = { fg = colors.white, bg = colors.grey },
					c = { fg = colors.white },
				},

				insert = { a = { fg = colors.black, bg = colors.blue } },
				visual = { a = { fg = colors.black, bg = colors.cyan } },
				replace = { a = { fg = colors.black, bg = colors.red } },

				inactive = {
					a = { fg = colors.white, bg = colors.black },
					b = { fg = colors.white, bg = colors.black },
					c = { fg = colors.white },
				},
			}

			require("lualine").setup({
				options = {
					theme = bubbles_theme,
					component_separators = "",
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
					lualine_b = { "filename", "branch" },
					lualine_c = {
						"%=", --[[ add your center compoentnts here in place of this comment ]]
					},
					lualine_x = {},
					lualine_y = { "filetype", "progress" },
					lualine_z = {
						{ "location", separator = { right = "" }, left_padding = 2 },
					},
				},
				inactive_sections = {
					lualine_a = { "filename" },
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "location" },
				},
				tabline = {},
				extensions = {},
			})
		end,
	},

	{
		"stevearc/dressing.nvim",
		opts = {},
		event = "VeryLazy",
		config = function()
			require("dressing").setup({})
		end,
	},

	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enable = false,
				},
				suggestion = {
					enable = false,
				},
			})
		end,
	},

	{
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},

	-- Smooth scroll
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({})
		end,
	},

	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		-- event = 'VeryLazy',
		config = function()
			require("bufferline").setup({
				options = {
					diagnostics = "nvim_lsp",
					separator_style = "slant",
				},
				-- highlights = {
				--   fill = {
				--     -- fg = '#24283b',
				--     -- bg = '#24283b',
				--     bg = {
				--       attribute = "fg",
				--       highlight = "Pmenu"
				--     },
				--     fg = {
				--       attribute = 'fg',
				--       highlight = 'Pmenu'
				--     }
				--   },
				-- }
			})
		end,
	},

	-- Comment
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = "VeryLazy",
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},

  -- Highlight color codes like #f6c177
  {
    'brenoprata10/nvim-highlight-colors',
    event = 'VeryLazy',
    config = function()
      require('nvim-highlight-colors').setup({})
    end
  },

  -- Preview LSP's goto definition and so on
  {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {}
    end
  },

  {
    'gorbit99/codewindow.nvim',
    config = function()
      local codewindow = require('codewindow')
      codewindow.setup(
        {
          auto_enable = true,
          screen_bounds = 'background',
          window_border = 'rounded',
          exclude_filetypes = { 'help', 'dashboard' }
        }
      )
      codewindow.apply_default_keybinds()
    end
  },

  {
    'smjonas/inc-rename.nvim',
    config = function()
      require("inc_rename").setup{
        input_buffer_type = 'dressing',
      }
    end,
  },

  { 'HiPhish/rainbow-delimiters.nvim', }
}
