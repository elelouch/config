(menu-bar-mode -1)  ; Leave this one on if you're a beginner!
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(global-display-line-numbers-mode 1)

(setq make-backup-files nil)

(when (member "JetBrainsMono Nerd Font Mono" (font-family-list))
  (set-face-attribute 'default nil :font "JetBrainsMono Nerd Font-14")
  (set-face-attribute 'fixed-pitch nil :family "JetBrainsMono Nerd Font-14"))

;; activate line numbering in all buffers/modes
(global-display-line-numbers-mode) 

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(add-hook 'yaml-mode-hook
          (lambda ()
            (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; set tab to spaces
(setq indent-tabs-mode nil)

;; c coding
(setq c-default-style "linux"
      c-basic-offset 4)

;; dired do what I mean
(setq dired-dwim-target t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("a2aea76e411311750871ade96aac4bc83457ced5feb1806d3905fb11b3f9c055"
     "a7026ae6351ed42b2e71f373e173e6d9da5bd0c5461dc1861aa74c1a247c1a97"
     default))
 '(package-selected-packages '(haskell-mode ir-black-theme magit yaml-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'ir-black)


;; exec path

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
			  "[ \t\n]*$"
			  ""
			  (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ;; eshell users
    (setq exec-path (split-string path-from-shell path-separator))))
			  
(when window-system (set-exec-path-from-shell-PATH))
