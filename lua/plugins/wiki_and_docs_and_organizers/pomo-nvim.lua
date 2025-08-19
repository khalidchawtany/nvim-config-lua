return {
	"epwalsh/pomo.nvim",
	version = "*", -- Recommended, use latest release instead of latest commit
	-- lazy = true,
	cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
	-- dependencies = {
	-- 	-- Optional, but highly recommended if you want to use the "Default" timer
	-- 	"rcarriga/nvim-notify",
	-- },
	config = function()
		local PrintNotifier = {}

		PrintNotifier.new = function(timer, opts)
			local self = setmetatable({}, { __index = PrintNotifier })
			self.timer = timer
			self.hidden = false
			self.opts = opts -- not used
			return self
		end

		PrintNotifier.start = function(self)
			require("snacks").notifier.notify(
				string.format("Starting timer #%d, %s, for %ds", self.timer.id, self.timer.name, self.timer.time_limit)
			)
		end

		PrintNotifier.tick = function(self, time_left)
			time_left = math.floor(time_left)

			-- 5 mins
			if time_left % 300 == 0 then
				vim.fn.jobstart({ "afplay", "/Users/juju/Development/Sounds/tic_short_faded.wav" }, {
					on_stdout = function(j, d, e) end,
				})
				return
			end

			-- 1 min
			if time_left % 60 == 0 then
				vim.fn.jobstart({ "afplay", "/Users/juju/Development/Sounds/1_tic_short_faded.mp3" }, {
					on_stdout = function(j, d, e) end,
				})
				return
			end
		end

		PrintNotifier.done = function(self)
			require("snacks").notifier.notify(string.format("Timer #%d, %s, complete", self.timer.id, self.timer.name))
			vim.fn.jobstart({ "afplay", "/Users/juju/Development/Sounds/Bebebebeeep.mp3" }, {
				on_stdout = function(j, d, e) end,
			})
		end

		PrintNotifier.stop = function(self) end

		PrintNotifier.show = function(self)
			self.hidden = false
		end

		PrintNotifier.hide = function(self)
			self.hidden = true
		end

		require("pomo").setup({

			-- How often the notifiers are updated.
			update_interval = 1000,

			-- Configure the default notifiers to use for each timer.
			-- You can also configure different notifiers for timers given specific names, see
			-- the 'timers' field below.
			notifiers = {
				-- The "Default" notifier uses 'vim.notify' and works best when you have 'nvim-notify' installed.
				{
					-- name = "Default",
					init = PrintNotifier.new,
					opts = {
						-- With 'nvim-notify', when 'sticky = true' you'll have a live timer pop-up
						-- continuously displayed. If you only want a pop-up notification when the timer starts
						-- and finishes, set this to false.
						sticky = true,

						-- Configure the display icons:
						title_icon = "󱎫",
						text_icon = "󰄉",
						-- Replace the above with these if you don't have a patched font:
						-- title_icon = "⏳",
						-- text_icon = "⏱️",
					},
				},

				-- The "System" notifier sends a system notification when the timer is finished.
				-- Available on MacOS and Windows natively and on Linux via the `libnotify-bin` package.
				{ name = "System" },

				-- You can also define custom notifiers by providing an "init" function instead of a name.
				-- See "Defining custom notifiers" below for an example 👇
				-- { init = function(timer) ... end }
			},

			-- Override the notifiers for specific timer names.
			timers = {
				-- For example, use only the "System" notifier when you create a timer called "Break",
				-- e.g. ':TimerStart 2m Break'.
				Break = {
					{ name = "System" },
				},
			},
			-- You can optionally define custom timer sessions.
			sessions = {
				-- Example session configuration for a session called "pomodoro".
				pomodoro = {
					{ name = "Work", duration = "25m" },
					{ name = "Short Break", duration = "5m" },
					{ name = "Work", duration = "25m" },
					{ name = "Short Break", duration = "5m" },
					{ name = "Work", duration = "25m" },
					{ name = "Long Break", duration = "15m" },
				},
			},
		})
	end,
}
