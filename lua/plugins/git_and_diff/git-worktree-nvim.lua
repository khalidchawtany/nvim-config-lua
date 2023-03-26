return {
	"ThePrimeagen/git-worktree.nvim",
	keys = {

		{ "<c-s><c-w>", function() require("telescope").extensions.git_worktree.create_git_worktree() end, desc = "Telescope: git work_trees create", },
		{ "<c-s><c-g>", function() require("telescope").extensions.git_worktree.git_worktrees() end, desc = "Telescope: git work_trees list", },
		-- { "<c-s><c-w>", "Telescope: git work_trees create" },
		-- { "<c-s><c-g>", "Telescope: git work_trees list" },},
	},
	-- lazy = true, -- TODO: this is not working for now
	config = function()
		require("git-worktree").setup({
			-- change_directory_command = <str> -- default: "cd",
			-- update_on_change = <boolean> -- default: true,
			-- update_on_change_command = <str> -- default: "e .",
			-- clearjumps_on_change = <boolean> -- default: true,
			-- autopush = <boolean> -- default: false,
		})

		require("telescope").load_extension("git_worktree")
	end,
}

--[[
Creates a worktree.  Requires the path, branch name, and the upstream
Example:
:lua require("git-worktree").create_worktree("feat-69", "master", "origin")

switches to an existing worktree.  Requires the path name
Example:
:lua require("git-worktree").switch_worktree("feat-69")

deletes to an existing worktree.  Requires the path name
Example:
:lua require("git-worktree").delete_worktree("feat-69")


Switch and Delete a worktrees

To bring up the telescope window listing your workspaces run the following
:lua require('telescope').extensions.git_worktree.git_worktrees()
 <Enter> - switches to that worktree
 <c-d> - deletes that worktree
 <c-f> - toggles forcing of the next deletion


Create a worktree
To bring up the telescope window to create a new worktree run the following

:lua require('telescope').extensions.git_worktree.create_git_worktree()
First a telescope git branch window will appear. Presing enter will choose the selected branch for the branch name. If no branch is selected, then the prompt will be used as the branch name.

After the git branch window, a prompt will be presented to enter the path name to write the worktree to.

As of now you can not specify the upstream in the telescope create workflow, however if it finds a branch of the same name in the origin it will use it



]]
--
