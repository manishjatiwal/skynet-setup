function SetColors(color)
	vim.cmd.colorscheme('cyberdream')   -- Set the colorscheme
    
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetColors()
