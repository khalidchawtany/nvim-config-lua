return {
    "3rd/image.nvim",
    cond = os.getenv("VAR_IS_KITTY_TERM") == "true",
    event = { "BufEnter", "BufWinEnter" },
    config = function()
        _G.only_render_image_at_cursor = false

        require("image").setup({
            backend = "kitty",
            integrations = {
                markdown = {
                    enabled = true,
                    clear_in_insert_mode = true,
                    download_remote_images = true,
                    only_render_image_at_cursor = _G.only_render_image_at_cursor,
                    filetypes = { "markdown", "vimwiki", "quarto" }, -- markdown extensions (ie. quarto) can go here
                },
                neorg = {
                    enabled = true,
                    clear_in_insert_mode = true,
                    download_remote_images = true,
                    only_render_image_at_cursor = _G.only_render_image_at_cursor,
                    filetypes = { "norg" },
                },
            },
            max_width = nil,
            max_height = nil,
            max_width_window_percentage = nil,
            max_height_window_percentage = 50,
            window_overlap_clear_enabled = true,                                     -- toggles images when windows are overlapped
            window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
            editor_only_render_when_focused = false,                                  -- auto show/hide images when the editor gains/looses focus
            tmux_show_only_in_active_window = false,                                  -- auto show/hide images in the correct Tmux window (needs visual-activity off)
            hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
        })

        vim.keymap.set("n", "<leader>qi", function()
            -- require("image").clear()
            _G.only_render_image_at_cursor = not _G.only_render_image_at_cursor
            require("image").setup({
                integrations = {
                    markdown = { only_render_image_at_cursor = _G.only_render_image_at_cursor, },
                    neorg = { only_render_image_at_cursor = _G.only_render_image_at_cursor, },
                },
            })
        end
        )
    end,
}
