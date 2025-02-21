local State = {
	ANTICIPATING_REASONING = 1,
	REASONING = 2,
	ANTICIPATING_OUTPUTTING = 3,
	OUTPUTTING = 4,
}
local _state = State.ANTICIPATING_OUTPUTTING

local openai = require("codecompanion.adapters.openai")

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
				choices = { "kimi-k1.5-preview" },
				default = "kimi-k1.5-preview",
			},
			temperature = {
				default = 0,
			},
		},
		setup = function(self)
			_state = State.ANTICIPATING_OUTPUTTING
			if self.opts and self.opts.stream then
				self.parameters.stream = true
				self.parameters.stream_options = { include_usage = true }
			end
			return true
		end,
		chat_output = function(self, data)
			local inner = openai.handlers.chat_output(self, data)

			if inner == nil then
				return inner
			end

			if inner.status ~= "success" or inner.output == nil or type(inner.output.content) ~= "string" then
				return inner
			end

			if string.find(inner.output.content, "<think>") ~= nil then
				_state = State.ANTICIPATING_REASONING
				inner.output.content = inner.output.content:gsub("%s*<think>%s*", "")
			elseif string.find(inner.output.content, "</think>") ~= nil then
				_state = State.ANTICIPATING_OUTPUTTING
				inner.output.content = inner.output.content:gsub("%s*</think>%s*", "")
			elseif inner.output.content:match("^%s*$") ~= nil then
				inner.output.content = ""
			elseif _state == State.ANTICIPATING_OUTPUTTING then
				_state = State.OUTPUTTING
			elseif _state == State.ANTICIPATING_REASONING then
				_state = State.REASONING
			end

			if _state == State.ANTICIPATING_REASONING or _state == State.REASONING then
				inner.output.reasoning = inner.output.content
				inner.output.content = nil
			end

			return inner
			-- return openai.handlers.chat_output(self, data)
		end,
	})
end
return setup_kimi
