
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; OwO
;;
;; emax 2.0
;;
;;  _______________________________________________________________ 
;; / No man shall send me to Hades before my time, / and no man, I \
;; | promise, has ever escaped his fate / from the moment that he  |
;; \ was born, whether brave man or coward.                        /
;;  --------------------------------------------------------------- 
;;      \                                             
;;       \                                            
;;        \ ▄▄▄▄▄▄▄▄▄   ▄                             
;;       ▀█▄██▄▄██▄▄█▄▄▄██                            
;;       ▄▄▄███▄▄███▄▄██▄██ █▄█ ▄▄                    
;;      ▄▀███▄▄██▄▄▄███████████▄██                    
;;       ███▄▄▄▄▄█████████▀█████▄▀                    
;;      ██▄▀██▄███▄████████████▄▄▄▄                   
;;     ▀▀▀  █▄███▄████▄█▄██▄███████                   
;;          █▄█▄█▄▄▄▄▄█▄▄████▄████▄▄▄▄▄▄▄▄▄▄▄         
;;          ▀▄▄█████████▄█▄█▄█▄█▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄       
;;             ▀▀▀█▄▄▄▄█▄███▄██▄▄▄▄▄▄▄▄▄██▄█▄█▄▀      
;;               ███▄███████▄██▄▄▄▄▀▀▄█▄█▄███▄██      
;;               ███████▄▄██▄▄███     ████████▄██     
;;               ██████████▄█▄▄███    ██▄██████▄█▄    
;;                ████▄▄███▄▄▄▄███    █▀██████████    
;;                ▄▄███▄██▄▄▄███       ████████▄██   
;;                 █▄████▀▀▄▄▄▄█▄▄▄     ▀▄▀▄██████▀▄  
;;                 ██████   ██▄▄███      ▀ ▀▄▄███▄▄   
;;                ███████   ██████▄▄         ▀▄██▄█▄▄ 
;;               ▄▄██████   ████████           ▀▀▀▀▀▀▀
;;              █▄███████   ███████▄▄                 
;;              ▀▀█▄███▄▀   ▀▀▀██████                 
;;                ▀▀▀▀▀▀       ▀▀▀▀▀▀                 
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; package manager
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t)

;; themes
(use-package monokai-theme :ensure t)
(use-package gruvbox-theme :ensure t)
(use-package solarized-theme :ensure t)
(use-package zenburn-theme :ensure t)
(use-package material-theme :ensure t :config)
(use-package base16-theme :ensure t :config)

(load-theme 'base16-monokai t)
(set-face-foreground 'font-lock-comment-face "green")
(set-face-foreground 'font-lock-comment-delimiter-face "green")

(use-package ivy :ensure t)
(ivy-mode 1)

(use-package counsel :ensure t)
(global-set-key (kbd "M-t") 'counsel-load-theme)

;; gui
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)
(global-hl-line-mode 1)
(global-display-line-numbers-mode 1)
(context-menu-mode 1)

(setq inhibit-startup-message t)     ;; Disable the startup message
(setq initial-scratch-message nil)   ;; Remove message in *scratch* buffer

(winner-mode 1)
;;(global-set-key (kbd "<escape>") #'winner-undo)

(delete-selection-mode 1) ;; typed text replaces selection

(defun esc-deselect-or-winner-undo ()
  "If region is active, deactivate it. Otherwise, run `winner-undo`."
  (interactive)
  (if (use-region-p)
      (deactivate-mark)
    (when (fboundp 'winner-undo)
      (winner-undo))))
(global-set-key (kbd "<escape>") #'esc-deselect-or-winner-undo)

(setq select-enable-clipboard t)

(editorconfig-mode 1)
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)

(use-package eglot :ensure t)
(add-hook 'c-mode-hook' #'eglot-ensure)
(add-hook 'c++-mode-hook' #'eglot-ensure)
(add-hook 'python-mode-hook' #'eglot-ensure)
(add-to-list 'eglot-server-programs '(c-mode . ("clangd")))
(add-to-list 'eglot-server-programs '(c++-mode . ("clangd")))
(add-to-list 'eglot-server-programs '(nim-mode . ("nimlsp")))
(add-to-list 'eglot-server-programs '((js-mode js2-mode typescript-mode tsx-ts-mode) . ("typescript-language-server" "--stdio")))
(add-to-list 'eglot-server-programs '((html-mode web-mode) . ("vscode-html-language-server" "--stdio")))
(add-to-list 'eglot-server-programs '((css-mode scss-mode less-css-mode) . ("vscode-css-language-server" "--stdio")))
(add-to-list 'eglot-server-programs '(go-mode . ("gopls")))
(add-to-list 'eglot-server-programs '(elixir-mode . ("elixir-ls")))
(add-to-list 'eglot-server-programs '(haskell-mode . ("haskell-language-server-wrapper" "--lsp")))
(with-eval-after-load 'eglot
  ;; Create a keymap for the prefix
  (define-prefix-command 'eglot-prefix-map)
  ;; Bind C-e as the Eglot prefix inside eglot-mode
  (define-key eglot-mode-map (kbd "C-e") 'eglot-prefix-map)
  ;; Bind Eglot commands under the prefix
  (define-key eglot-prefix-map (kbd "r") 'eglot-rename)
  (define-key eglot-prefix-map (kbd "a") 'eglot-code-actions)
  (define-key eglot-prefix-map (kbd "f") 'eglot-format)
  (define-key eglot-prefix-map (kbd "h") 'eldoc)
  (define-key eglot-prefix-map (kbd "o") 'eglot-code-action-organize-imports))

(use-package company :ensure t :init)
(global-company-mode 1)

(add-hook 'eglot-managed-mode-hook #'company-mode)

(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'undo-tree-redo)
;;(global-set-key (kbd "C-<backspace>") #'backward-kill-word)
(global-set-key (kbd "C-S-<backspace>") #'backward-kill-word)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-g") #'goto-line)

(global-set-key (kbd "s-q") #'delete-window)

(defun open-config ()
  "Open my init file."
  (interactive)
  (find-file user-init-file))
(global-set-key (kbd "s-c") #'open-config)

(defun copy-region-or-line ()
  "Copy region if active, else copy the current line."
  (interactive)
  (if (use-region-p)
      (kill-ring-save (region-beginning) (region-end))
    (kill-ring-save (line-beginning-position) (line-end-position))
    (message "Copied line")))
(with-eval-after-load 'winner
 (define-key winner-mode-map (kbd "C-c <left>") nil)
 (define-key winner-mode-map (kbd "C-c <right>") nil))
(define-key emacs-lisp-mode-map (kbd "C-c C-b") nil)
(define-key emacs-lisp-mode-map (kbd "C-c C-e") nil)
(define-key emacs-lisp-mode-map (kbd "C-c C-f") nil)
(global-set-key (kbd "C-c") nil)
(define-key global-map (kbd "C-c") nil)
;; Override C-c
(defvar my-override-c-c-map (make-sparse-keymap))
(define-key my-override-c-c-map (kbd "C-c") #'copy-region-or-line)
(define-minor-mode my-override-c-c-mode
  "Override C-c."
  :global t
  :keymap my-override-c-c-map)
(my-override-c-c-mode 1)

(use-package which-key :ensure t :init)
(which-key-mode 1)

(use-package vterm :ensure t
  :hook (vterm-mode . (lambda () (setq-local global-hl-line-mode nil))))
(global-set-key (kbd "s-t") #'vterm)

(defun cut-region-or-line ()
  "Cut region if active, otherwise cut the current line like `dd`."
  (interactive)
  (if (use-region-p)
      (kill-region (region-beginning) (region-end))
    (kill-whole-line)))
(global-set-key (kbd "C-d") 'cut-region-or-line)

(use-package swiper :ensure t)
(global-set-key (kbd "C-f") 'swiper)
(global-set-key (kbd "C-M-f") 'counsel-rg)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-b") 'counsel-switch-buffer)

(defun select-current-line ()
  "Select the current line without cutting or killing."
  (interactive)
  (beginning-of-line)
  (push-mark (line-end-position) nil t))
(global-set-key (kbd "C-w") #'my/select-current-line)

(use-package undo-tree :ensure t :init)
(global-undo-tree-mode 1)

(defun move-up-to-line-end ()
  "Move cursor up one line and go to end of that line."
  (interactive)
  (forward-line -1)
  (end-of-line))
(defun move-down-to-line-end ()
  "Move cursor down one line and go to end of that line."
  (interactive)
  (forward-line 1)
  (end-of-line))
(global-set-key (kbd "M-<up>") #'move-up-to-line-end)
(global-set-key (kbd "M-<down>") #'move-down-to-line-end)

(defun delete-current-line ()
  "Delete the current line without copying it to the kill ring, safe for last line."
  (interactive)
  (let ((start (line-beginning-position))
        (end (min (1+ (line-end-position)) (point-max))))
    (delete-region start end)))
(global-set-key (kbd "C-<backspace>") #'delete-current-line)

(global-set-key (kbd "s-q") 'delete-window)

(defun comment-or-uncomment ()
  "Comment or uncomment current line or active region."
  (interactive)
  (if (use-region-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-line 1)))
(global-set-key (kbd "C-l") 'comment-or-uncomment)

(defun other-window-backward ()
  "Move to the previous window."
  (interactive)
  (other-window -1))
(defun other-window-forward ()
  (interactive)
  (other-window +1))
(global-set-key (kbd "s-e") #'other-window-forward)

(use-package gcmh :ensure t :config)
(gcmh-mode 1)

(setq server-window 'pop-to-buffer server-switch-hook nil)
(defun open-in-current-window ()
  "Force next emacsclient file to open in current window."
  (interactive)
  (let ((server-window 'switch-to-buffer))
    (server-edit)))

(defun dired-current-file-dir ()
  "Open dired at the current file's directory."
  (interactive)
  (let ((dir (if buffer-file-name
                 (file-name-directory buffer-file-name)
               default-directory)))
    (dired dir)))
(global-set-key (kbd "s-f") #'dired-current-file-dir)
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  ;; Use RET to open files/directories in the same buffer (replace dired buffer)
  (define-key dired-mode-map (kbd "RET") #'dired-find-alternate-file)
  ;; Use ^ to go up a directory, replacing buffer instead of opening new one
  (define-key dired-mode-map (kbd "^")
    (lambda ()
      (interactive)
      (find-alternate-file ".."))))

(use-package dired-git-info
  :hook (dired-mode . dired-git-info-auto-enable)
  :bind (:map dired-mode-map
              (")" . dired-git-info-mode)))
(setq dired-auto-revert-buffer t)
(add-hook 'dired-mode-hook 'auto-revert-mode)

(use-package diff-hl
  :hook ((dired-mode . diff-hl-dired-mode)
         (magit-post-refresh . diff-hl-magit-post-refresh))
  :config
  (global-diff-hl-mode))

(use-package blamer
  :defer t
  :custom
  (blamer-idle-time 0.5)
  (blamer-min-offset 70)
  (blamer-prettify-time-p t)
  (blamer-type 'visual)  ;; Show as overlay
  :custom-face
  (blamer-face ((t :foreground "#7a88cf"
                   :background nil
                   :height 0.9
                   :italic t)))
  :hook (prog-mode . blamer-mode))

(require 'midnight)
(midnight-mode 1)

(require 'server)
(unless (server-running-p)
  (server-start))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(base16-theme bases16-theme blamer company counsel diff-hl
				  doom-themes eat elixir-mode flycheck gcmh git
				  go-mode good-scroll gruvbox-theme lsp-ui magit
				  material-theme monokai-theme multiple-cursors
				  projectile solarized-theme super-save
				  typescript-mode undo-tree vterm web-mode yaml-mode
				  yasnippet zenburn-theme zig-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
