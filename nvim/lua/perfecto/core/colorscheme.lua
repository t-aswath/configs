-- setup must be called before loading the colorscheme
-- Default options:
require("gruvbox").setup({
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = true,
		comments = true,
		operators = false,
		folds = true,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "", -- can be "hard", "soft" or empty string
	palette_overrides = {
		dark0_hard = "#1d2021",
		dark0 = "#0C0E17",
		dark0_soft = "#32302f",
		dark1 = "#3c3836",
		dark2 = "#504945",
		dark3 = "#665c54",
		dark4 = "#7c6f64",
		light0_hard = "#f9f5d7",
		light0 = "#fbf1c7",
		light0_soft = "#f2e5bc",
		light1 = "#ebdbb2",
		light2 = "#d5c4a1",
		light3 = "#bdae93",
		light4 = "#a89984",
		bright_red = "#e85741",
		bright_green = "#b9bb46",
		bright_yellow = "#f1bf50",
		bright_blue = "#8aa499",
		bright_purple = "#bc8192",
		bright_aqua = "#739f74",
		bright_orange = "#fe8019",
		neutral_red = "#e85741",
		neutral_green = "#b9bb46",
		neutral_yellow = "#f1bf50",
		neutral_blue = "#8aa499",
		neutral_purple = "#bc8192",
		neutral_aqua = "#739f74",
		neutral_orange = "#fe8019",
		faded_red = "#e85741",
		faded_green = "#b9bb46",
		faded_yellow = "#f1bf50",
		faded_blue = "#8aa499",
		faded_purple = "#bc8192",
		faded_aqua = "#739f74",
		faded_orange = "#fe8019",
		gray = "#928374",
	},
	overrides = {},
	dim_inactive = false,
	transparent_mode = false,
})

-- setup must be called before loading

local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end
