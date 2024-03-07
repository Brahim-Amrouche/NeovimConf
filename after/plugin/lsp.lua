local lsp_zero = require('lsp-zero')
local cmp = require('cmp')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set('n', "<leader>gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', "<leader>h", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set('n' , "<leader>of" , function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set('n', "<leader>gnd", function () vim.diagnostic.goto_next() end, opts)
  vim.keymap.set('n', "<leader>gpd", function () vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set('n', "<leader>ca", function() vim.lsp.buf.code_action()  end, opts)
  vim.keymap.set('n', "<leader>rr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set('n', "<leader>rn", function () vim.lsp.buf.rename() end, opts)
  vim.keymap.set('n', "<C-h>", function () vim.lsp.buf.signature_help() end, opts)
end)

require("mason").setup()
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "quick_lint_js"},
  automatic_installation = true,

  handlers = {
	  lsp_zero.default_setup,
  }
})


cmp.setup({
	sources = {
		{name = "nvim_lsp"}
	},
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({select = true}),
		['<Esc>'] = cmp.mapping.abort(),
		['<C-Space>'] = cmp.mapping.complete(),
	})
})
