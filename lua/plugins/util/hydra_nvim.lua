return {
	"anuvyklack/hydra.nvim",
	event = "VeryLazy",
	config = function ()
		require('plugins/util/hydras/option_switcher');
		require('plugins/util/hydras/telescope');
	end
}
