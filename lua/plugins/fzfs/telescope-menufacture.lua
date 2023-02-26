return {
	"molecule-man/telescope-menufacture",
  dependencies = {"nvim-telescope/telescope.nvim"},
  keys = {
		{ "<c-s><c-p>", function() require('telescope').extensions.menufacture.find_files()end,  desc = "Telescope: Find files (c^)" },
		{ "<c-s><c-a>", function() require('telescope').extensions.menufacture.live_grep()end,   desc = "Telescope: live_grep (c^)" },
		{ "<c-s>a",     function() require('telescope').extensions.menufacture.grep_string()end, desc = "Telescope: grep_string (c^)" },
		{ "<c-s>d",     function()
			require('telescope').extensions.menufacture.add_menu(require('telescope.builtin').find_files, {
				[{ 'i', 'n' }] = {
					['<C-^>'] = vim.tbl_extend('force', require('telescope').extensions.menufacture.find_files_menu, {
						['change cwd to parent'] = function(opts, callback)
							local cwd = opts.cwd and vim.fn.expand(opts.cwd) or vim.loop.cwd()
							opts.cwd = vim.fn.fnamemodify(cwd, ':p:h:h')
							callback(opts)
						end,
					}),
				},
			})
		end, desc = "Telescope: grep_string (c^)" },
  },
  config = function ()
	  require('telescope').load_extension 'menufacture'
  end
}







--  vim.keymap.set(
--   'n',
--   '<leader>sf',
--   require('telescope').extensions.menufacture.add_menu(require('telescope.builtin').find_files, {
--     [{ 'i', 'n' }] = {
--       ['<C-i>'] = require('telescope').extensions.menufacture.find_files_menu,
--     },
--   })
-- )
-- vim.keymap.set(
--   'n',
--   '<leader>sg',
--   require('telescope').extensions.menufacture.add_menu(require('telescope.builtin').live_grep, {
--     [{ 'i', 'n' }] = {
--       ['<C-i>'] = require('telescope').extensions.menufacture.live_grep_menu,
--     },
--   })
-- )
-- vim.keymap.set(
--   'n',
--   '<leader>sw',
--   require('telescope').extensions.menufacture.add_menu(require('telescope.builtin').grep_string, {
--     [{ 'i', 'n' }] = {
--       ['<C-i>'] = require('telescope').extensions.menufacture.grep_string_menu,
--     },
--   })
-- )
