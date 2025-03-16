(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(set-default 'truncate-lines t)
(setq ring-bell-function 'ignore)

<<<<<<< HEAD
(when (member "DejaVu Sans Mono" (font-family-list))
  (set-face-attribute 'default nil :font "DejaVu Sans Mono-13")
  (set-face-attribute 'fixed-pitch nil :family "DejaVu Sans Mono-13"))
=======
(when (member "Hack" (font-family-list))
  (set-face-attribute 'default nil :font "Hack-12")
  (set-face-attribute 'fixed-pitch nil :family "Hack-12"))
>>>>>>> 11ed287 (removed mason from neovim)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(add-hook 'yaml-mode-hook
          (lambda ()
            (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; c coding
(setq c-default-style "linux"
      c-basic-offset 4)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
<<<<<<< HEAD
   '("bbef594f597966fac261803366af6fe111048e50571baad2e40a4820b65c203a" "09b833239444ac3230f591e35e3c28a4d78f1556b107bafe0eb32b5977204d93" "b8bd60a23b9e2f08b0c437231ee84f2dacc70fdc4d5a0fb87229bb9926273fdd" "acfe7ff6aacb9432f124cde4e35d6d2b4bc52916411de73a6ccded9750c9fa97" "dc15dbd4b0a00c64610fd4379a89424e0be1b418f09457e0f062cac931e8ca82" default))
 '(package-selected-packages '(zenburn-theme tao-theme haskell-mode magit yaml-mode)))
=======
   '("ebdaa6f5ec2f4c5afb361d785d7c49374c4f0d0c0512132bc87f1372ffd9f506" default))
 '(package-selected-packages '(seq cherry-blossom-theme haskell-mode magit yaml-mode)))
>>>>>>> 11ed287 (removed mason from neovim)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
			  "[ \t\n]*$"
			  ""
			  (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ;; eshell users
    (setq exec-path (split-string path-from-shell path-separator))))			  
(when window-system (set-exec-path-from-shell-PATH))

(setq make-backup-files nil)
;; set tab to spaces
(setq indent-tabs-mode nil)
;; haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(setq dired-dwim-target t)
(setq dired-guess-shell-alist-user '(("\\.pdf\\'" "mupdf")))

<<<<<<< HEAD
=======
(load-theme 'cherry-blossom)

>>>>>>> 11ed287 (removed mason from neovim)
;; Org Mode
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c l") #'org-insert-link)
(global-set-key (kbd "C-c o") #'open-link-at-point)
(global-set-key (kbd "M-o") #'other-window)

<<<<<<< HEAD
(setq zenburn-override-colors-alist
      '(("zenburn-bg" . "#212121")))
(load-theme 'zenburn t)
=======
(setq package-install-upgrade-built-in t)
>>>>>>> 11ed287 (removed mason from neovim)
