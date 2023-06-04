;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el


;; leetcode
(package! leetcode)

;; Github Copilot
(package! copilot
  :recipe (:host github :repo "zerolfx/copilot.el" :files ("*.el" "dist")))

(package! ox-hugo)

(package! pinentry)

;; install chezmoi
(package! chezmoi)
