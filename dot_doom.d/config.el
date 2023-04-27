;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; user info
(setq user-full-name "Alhaitham Al Jabri"
      user-mail-address "jabri.dev@gmail.com")

;; doom theme
(setq doom-theme 'leuven)

;; doom font
(setq display-line-numbers-type t)

;; leetcode config
(setq leetcode-prefer-language "golang")

;; copilot mode config
;; enable copilot mode in all modes
(use-package! copilot

  :hook (
         (go-mode . copilot-mode)
         (yaml-mode . copilot-mode)
         (java-mode . copilot-mode)
         (markdown-mode . copilot-mode))
  :bind (("C-TAB" . 'copilot-accept-completion-by-word)
         ("C-<tab>" . 'copilot-accept-completion-by-word)
         :map copilot-completion-map
         ("<tab>" . 'copilot-accept-completion)
         ("TAB" . 'copilot-accept-completion)
         ("C-a" . 'copilot-accept-completion)
         ("C-g" . #'copilot-clear-overlay)
         ("C-n" . #'copilot-next-completion)
         ("C-p" . #'copilot-previous-completion))
  )

;; docstring warning fix
(setq byte-compile-warnings '(not docstrings))

(setq browse-url-chrome-program "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome")
