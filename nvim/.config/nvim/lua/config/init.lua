-- File: config/init.lua

-- Ensure packer is installed and added to runtimepath
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use "nvim-lua/plenary.nvim"
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
   use {
   'bitcode/metacode_ai',
   branch = 'master',
   requires = {'nvim-telescope/telescope.nvim'},
   config = function()
       require('telescope').load_extension('metacode_ai')
   end,
   post_install = function()
      local plugin_dir = vim.fn.stdpath('data')..'/site/pack/packer/start/metacode_ai/python'
      vim.fn.system('pip install --user .', plugin_dir)
    end,
  }
end)

