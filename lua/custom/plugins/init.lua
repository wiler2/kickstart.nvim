-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'folke/flash.nvim',
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
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  },

  -- { 'AlamarW/neovim-twee-syntax-highlighting-' },

  {
    'folke/zen-mode.nvim',
    dependencies = {
      'folke/twilight.nvim', -- Optional: Dims inactive code outside of your current scope
    },

    event = 'VeryLazy',
    config = function()
      require('zen-mode').setup {
        window = {
          backdrop = 0.95, -- Shade the background slightly
          width = 100, -- Width of the centered window (in columns)
          height = 1, -- Height of the window (1 means 100% of the screen)
          options = {
            signcolumn = 'no', -- Disable signcolumn
            number = false, -- Disable line numbers
            relativenumber = false, -- Disable relative line numbers
            cursorline = false, -- Disable cursorline
            cursorcolumn = false, -- Disable cursor column
            foldcolumn = '0', -- Disable fold column
            list = false, -- Disable whitespace characters
          },
        },
        plugins = {
          options = {
            enabled = true,
            ruler = false, -- Disables the ruler text in the cmd line area
            showcmd = false, -- Disables the command in the last line of the screen
          },
          twilight = { enabled = true },
          gitsigns = { enabled = false },
          tmux = { enabled = false },
          kitty = {
            enabled = true,
            font = '+2', -- Increases Kitty terminal font size by 2 when active
          },
        },
        on_open = function(win)
          vim.api.nvim_echo({ { 'Entered Zen Mode', 'Normal' } }, false, {})
        end,
        on_close = function()
          vim.api.nvim_echo({ { 'Exited Zen Mode', 'Normal' } }, false, {})
        end,
      }

      -- Map <leader>z to toggle the centered view
      vim.keymap.set('n', '<leader>z', function()
        require('zen-mode').toggle()
      end, { desc = 'Toggle Zen Mode', noremap = true, silent = true })
    end,
  },

  { 'NMAC427/guess-indent.nvim' }, -- Detect tabstop and shiftwidth automatically
  event = { 'BufReadPre', 'BufNewFile' },
}
