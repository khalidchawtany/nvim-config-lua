local State = {
	ANTICIPATING_REASONING = 1,
	REASONING = 2,
	ANTICIPATING_OUTPUTTING = 3,
	OUTPUTTING = 4,
}
local _state = State.ANTICIPATING_OUTPUTTING

local openai = require("codecompanion.adapters.http.openai")
local utils = require("codecompanion.utils.adapters")

local setup_kimi = function()
	return require("codecompanion.adapters").extend("openai_compatible", {
		env = {
			api_key = "cmd:cat ~/.local/share/nvim/keys/kimi.txt",
			chat_url = "/chat/completions",
			url = "https://api.moonshot.ai/v1",
		},
		name = "kimi",
		schema = {
			model = {
				choices = {
					["kimi-k1.5-preview"] = {
						{ opts = { can_reason = true } },
					},
				},
				default = "kimi-k1.5-preview",
			},
			temperature = {
				default = 0,
			},
		},
		-- setup = function(self)
		-- 	_state = State.ANTICIPATING_OUTPUTTING
		-- 	if self.opts and self.opts.stream then
		-- 		self.parameters.stream = true
		-- 		self.parameters.stream_options = { include_usage = true }
		-- 	end
		-- 	return true
		-- end,
		chat_output = function(self, data)
			local output = {}

			if data and data ~= "" then
				local data_mod = utils.clean_streamed_data(data)
				local ok, json = pcall(vim.json.decode, data_mod, { luanil = { object = true } })

				if ok and json.choices and #json.choices > 0 then
					local choice = json.choices[1]
					local delta = (self.opts and self.opts.stream) and choice.delta or choice.message

					if delta then
						output.role = nil
						if delta.role then
							output.role = delta.role
						end
						if self.opts.can_reason and delta.reasoning_content then
							output.reasoning = delta.reasoning_content
						end
						if delta.content then
							output.content = (output.content or "") .. delta.content
						end
						return {
							status = "success",
							output = output,
						}
					end
				end
			end
		end,
		inline_output = function(self, data, context)
			return openai.handlers.inline_output(self, data, context)
		end,
		on_exit = function(self, data)
			return openai.handlers.on_exit(self, data)
		end,
	})
end
return setup_kimi
