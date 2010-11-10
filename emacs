; disable splash screen
(setq inhibit-splash-screen t)

; disable toolbar
(tool-bar-mode 0)

; set color theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-gray30)

; show line and column numbers
(setq line-number-mode 1)
(setq column-number-mode 1)

; indent using spaces, not tabs
(setq-default indent-tabs-mode nil)

; latex stuff 
(setq latex-run-command "latex")
(setq tex-dvi-view-command "xdvi")
