;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; user info
(setq user-full-name "Alhaitham Al Jabri"
      user-mail-address "jabri.dev@gmail.com")

;; doom theme
(setq doom-theme 'doom-one)

;; doom font
(setq display-line-numbers-type t)

;; leetcode config
(setq leetcode-prefer-language "golang")

;; copilot mode config
;; enable copilot mode in all modes
(use-package! copilot

  :hook (
         (go-mode . copilot-mode)
         (javascript-mode . copilot-mode)
         (yaml-mode . copilot-mode)
         (java-mode . copilot-mode)
         (python-mode . copilot-mode)
         (rust-mode . copilot-mode)
         (emacs-lisp-mode . copilot-mode)
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

(setq epa-pinentry-mode 'loopback)

(use-package! chezmoi
  :commands (chezmoi-find chezmoi-write chezmoi-diff chezmoi-magit-status)
  :config
  (require 'cl)
  ;; Automatically update target files.
  (add-hook! after-save-hook :append
    (when chezmoi-buffer-target-file
      (chezmoi-write buffer-target-file))))

(defun +chezmoi/apply-all ()
  "Run =chezmoi apply= in a *compilation* buffer."
  (interactive)
  (autoload 'doom--if-compile
    (expand-file-name "core/autoload/config.el" user-emacs-directory)
    nil nil 'macro)
  (doom--if-compile "chezmoi apply"
      (message "Dotfiles applied successfully!")
    (message "Failed to apply dotfiles")))

(defun +chezmoi/update ()
  "Run =chezmoi update= in a *compilation* buffer."
  (interactive)
  (autoload 'doom--if-compile
    (expand-file-name "core/autoload/config.el" user-emacs-directory)
    nil nil 'macro)
  (doom--if-compile "chezmoi update"
      (message "Dotfiles updated successfully!")
    (message "Failed to update dotfiles")))

(map! :leader
      (:prefix ("d" . "dotfile")
       :desc "Write all dotfiles"  "a" #'+chezmoi/apply-all
       :desc "Dotfile diff"        "d" #'chezmoi-diff
       :desc "Find dotfile"        "f" #'chezmoi-find
       :desc "Dotfile repo status" "s" #'chezmoi-magit-status
       :desc "Update dotfiles"     "u" #'+chezmoi/update))
