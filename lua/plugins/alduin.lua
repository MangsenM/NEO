return{
 "bakageddy/alduin.nvim",
 priority = 1000 ,
 config = true ,

opts = {
  terminal_colors = true,
  inverse = true,
  palette_overrides = {},
  overrides = {},
},

init = function()

	vim.cmd.colorscheme "alduin"

	vim.api.nvim_set_hl(0, 'MatchParen',{ fg = '#FFFFFF', bg = '#8B4513', underline = false })
end,
}
