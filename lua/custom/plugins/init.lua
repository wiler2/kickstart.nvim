-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    -- lazy = true,
    init = function()
      -- Disable entire built-in ftplugin mappings to avoid conflicts.
      -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
      vim.g.no_plugin_maps = true

      -- Or, disable per filetype (add as you like)
      -- vim.g.no_python_maps = true
      -- vim.g.no_ruby_maps = true
      -- vim.g.no_rust_maps = true
      -- vim.g.no_go_maps = true
    end,
    config = function()
      -- put your config here
    end,
  },

  -- {
  --   'sphamba/smear-cursor.nvim',
  --   opts = { -- Default  Range
  --     stiffness = 0.8, -- 0.6      [0, 1]
  --     trailing_stiffness = 0.6, -- 0.45     [0, 1]
  --     stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
  --     trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
  --     damping = 0.95, -- 0.85     [0, 1]
  --     damping_insert_mode = 0.95, -- 0.9      [0, 1]
  --     distance_stop_animating = 0.5, -- 0.1      > 0
  --   },
  -- },

  {
    'folke/zen-mode.nvim',
    config = function()
      require('zen-mode').setup {
        window = {
          -- This is the magic number: it locks your code to 100 columns wide
          -- and perfectly centers it on your screen.
          width = 100,
          options = {
            -- Keeps your line numbers visible even when centered
            number = true,
            relativenumber = true,
          },
        },
        -- This is the section that controls the "invisible" UI changes
        plugins = {
          options = {
            enabled = true,
            ruler = true, -- Keeps the line/column tracker if you use it
            showcmd = true, -- Keeps the command display at the bottom

            -- The Magic Fix: Forces the statusline to stay visible!
            -- (Change to 2 if you don't use a global statusline)
            laststatus = 3,
          },
        },
      }

      -- Create a quick keyboard shortcut to toggle it on and off
      vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<CR>', { desc = 'Toggle Zen Mode' })
    end,
  },
  -- {
  --   'MeanderingProgrammer/render-markdown.nvim',
  --   dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
  --   -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
  --   -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  --   ---@module 'render-markdown'
  --   ---@type render.md.UserConfig
  --   opts = {},
  --   config = function()
  --     require('render-markdown').setup {
  --       completions = { lsp = { enabled = true } },
  --       -- Add other options here later if you want icons!
  --     }
  --   end,
  -- },

  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',

    event = {
      'BufReadPre ' .. vim.fn.expand '~/Documents/Brain' .. '/*.md',
      'BufNewFile ' .. vim.fn.expand '~/Documents/Brain' .. '/*.md',
    },

    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = 'brain',
          path = '~/Documents/Brain', -- This is your new path!
        },
      },

      -- see below for full list of options 👇
    },
  },

  {
    'alex-popov-tech/store.nvim',
    dependencies = { 'OXY2DEV/markview.nvim' },
    opts = {},
    cmd = 'Store',
  },

  {
    'urtzienriquez/learnlua.nvim',
    cmd = 'Learn',
  },

  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    --- @type Flash.Config
    opts = {
      modes = {
        search = {
          enabled = true,
        },
      },
    },
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = {"o"}, function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  },

  -- { 'AlamarW/neovim-twee-syntax-highlighting-' },

  { 'NMAC427/guess-indent.nvim' }, -- Detect tabstop and shiftwidth automatically
  event = { 'BufReadPre', 'BufNewFile' },
}
