local M = {
		keys = {"<Plug>Lightspeed_s"}
}

M.init = function()
    -- dump("Init is running ")
    vim.cmd [[nmap s <Plug>Lightspeed_omni_s]]
end

M.config = function()

    require'lightspeed'.setup {
        -- jump_on_partial_input_safety_timeout = 400,
        -- grey_out_search_area = false,
        gighlight_unique_chars = false,
        match_only_the_start_of_same_char_seqs = true,
        limit_ft_matches = 5,

        -- jump_to_unique_chars = false,
        -- safe_labels = {}
    }
end

return M
