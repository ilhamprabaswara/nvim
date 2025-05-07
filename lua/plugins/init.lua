return {
  { 
    "folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
  },
  { 
		"neoclide/coc.nvim", 
		branch = "release",
		config = function()
			local keyset = vim.keymap.set
			
			keyset('i', '<C-Space>', 'coc#refresh()', { silent = true, expr = true })
			keyset("n", "gd", "<Plug>(coc-definition)", { silent = true, nowait = true })
			keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true, nowait = true  })
			keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true, nowait = true  })
			keyset("n", "gr", "<Plug>(coc-references)", { silent = true, nowait = true  })
			keyset("n", "<F2>", "<Plug>(coc-rename)", { silent = true, nowait = true  })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = function()
			local opts = {
				signs = {
				 add          = { text = '┃' },
  		 	 change       = { text = '┃' },
  		 	 delete       = { text = '_' },
  		 	 topdelete    = { text = '‾' },
  		 	 changedelete = { text = '~' },
  		 	 untracked    = { text = '┆' },
			 },
				signs_staged = {
  			  add          = { text = '┃' },
  			  change       = { text = '┃' },
  			  delete       = { text = '_' },
  			  topdelete    = { text = '‾' },
  			  changedelete = { text = '~' },
  			  untracked    = { text = '┆' },
  			},
  			signs_staged_enable = true,
  			signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  			numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  			linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  			word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  			watch_gitdir = {
  			  follow_files = true
  			},
  			auto_attach = true,
  			attach_to_untracked = false,
  			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  			current_line_blame_opts = {
  			  virt_text = true,
  			  virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
  			  delay = 1000,
  			  ignore_whitespace = false,
  			  virt_text_priority = 100,
  			  use_focus = true,
  			},
  			current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  			sign_priority = 6,
  			update_debounce = 100,
  			status_formatter = nil, -- Use default
  			max_file_length = 40000, -- Disable if file is longer than this (in lines)
  			preview_config = {
  			  -- Options passed to nvim_open_win
  			  border = 'single',
  			  style = 'minimal',
  			  relative = 'cursor',
  			  row = 0,
  			  col = 1
  			},
						}
					return opts
				end
	},
	{
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      vim.o.laststatus = vim.g.lualine_laststatus

      local opts = {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = false,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          }
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {{'filename', path = 1}},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }

      return opts
    end,
  },
	{
		"prettier/vim-prettier",
    build = "yarn install --frozen-lockfile --production",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local keyset = vim.keymap.set
			local builtin = require("telescope.builtin")

			keyset('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
			keyset('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
			keyset('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
			keyset('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
		end,

	},
  "ryanoasis/vim-devicons",
	{
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
			indent = {
				-- character to use for indent guides
        char = "│",
        -- optional: adjust the repeat spacing manually, e.g., use 2 spaces instead of 4
        tab_char = "│", -- alternative if using tabs
      },
      whitespace = {
				remove_blankline_trail = false, -- keep whitespace markers
			},
      scope = {
				enabled = true,
      },
		},
	},
	"tpope/vim-fugitive"
}
