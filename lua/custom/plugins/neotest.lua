-- https://github.com/nvim-neotest/neotest
return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'zidhuss/neotest-minitest',
  },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('neotest').setup {
      adapters = {
        require 'neotest-minitest',
      },
    }
    vim.keymap.set('n', '<leader>rt', require('neotest').run.run, { expr = true, desc = 'Run nearest test' })
    vim.keymap.set('n', '<leader>rf', function()
      require('neotest').run.run(vim.fn.expand '%')
    end, { desc = 'Run all tests' })
  end,
}
