local M = {}

M.init = function()
    -- dump("Init is running ")
    vim.cmd [[ nmap s <Plug>Lightspeed_s ]]
end

M.config = function()

    require'lightspeed'.setup {
        jump_on_partial_input_safety_timeout = 400,
        gighlight_unique_chars = false,
        grey_out_search_area = false,
        match_only_the_start_of_same_char_seqs = true,
        limit_ft_matches = 5,
    }
end

return M
