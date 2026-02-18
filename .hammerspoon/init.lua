hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.repos.PaperWM = {
    url = "https://github.com/mogenson/PaperWM.spoon",
    desc = "PaperWM.spoon repository",
    branch = "release",
}

spoon.SpoonInstall:andUse("PaperWM", {
    repo = "PaperWM",
    config = { screen_margin = 4, window_gap = 8 },
    start = true,
    hotkeys = {
		focus_left  = {{"alt", "cmd", "ctrl"}, "h"},
		focus_right = {{"alt", "cmd", "ctrl"}, "l"},
		focus_up    = {{"alt", "cmd", "ctrl"}, "k"},
		focus_down  = {{"alt", "cmd", "ctrl"}, "j"},

		swap_left  = {{"alt", "cmd", "ctrl", "shift"}, "h"},
		swap_right = {{"alt", "cmd", "ctrl", "shift"}, "l"},
		swap_up    = {{"alt", "cmd", "ctrl", "shift"}, "k"},
		swap_down  = {{"alt", "cmd", "ctrl", "shift"}, "j"},

		center_window        = {{"alt", "cmd", "ctrl"}, "c"},
		full_width           = {{"alt", "cmd", "ctrl"}, "f"},
		cycle_width          = {{"alt", "cmd", "ctrl"}, "r"},

		slurp_in = {{"alt", "cmd", "ctrl", "shift"}, ","},
		barf_out = {{"alt", "cmd", "ctrl", "shift"}, "."},
    }
})
