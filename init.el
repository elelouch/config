(menu-bar-mode -1)  ; Leave this one on if you're a beginner!
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(global-display-line-numbers-mode 1)

(setq make-backup-files nil)

(load-theme 'danneskjold t)

(when (member "JetBrainsMono Nerd Font Mono" (font-family-list))
  (set-face-attribute 'default nil :font "JetBrainsMono Nerd Font-14")
  (set-face-attribute 'fixed-pitch nil :family "JetBrainsMono Nerd Font-14"))

;; activate line numbering in all buffers/modes
(global-display-line-numbers-mode) 

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

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
   '("51fa6edfd6c8a4defc2681e4c438caf24908854c12ea12a1fbfd4d055a9647a3"
     "061a51bb4c6782d25243b975d1da8f11100b158c4d84d5b582a41febca43597a"
     "8b4af9cacdaaf0a85e968abb2111f563cf82a16a005b7fac6f6026cc5d13bd10"
     "ebdaa6f5ec2f4c5afb361d785d7c49374c4f0d0c0512132bc87f1372ffd9f506"
     "8363207a952efb78e917230f5a4d3326b2916c63237c1f61d7e5fe07def8d378"
     default))
 '(package-selected-packages '(danneskjold-theme magit yaml-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
