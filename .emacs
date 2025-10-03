
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

;;(setq debug-on-error t)

;; package manager
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(require 'use-package)
(setq use-package-always-ensure t)

(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-<backspace>") #'backward-kill-word)
(global-set-key (kbd "C-a") 'mark-whole-buffer)

(global-set-key (kbd "C-g") #'goto-line)
(global-set-key (kbd "s-q") #'delete-window)

(global-set-key (kbd "M-v") 'eval-expression)

;; vanilla cfg binds
(defun reload-cfg ()
  "Reload Emacs configuration file."
  (interactive)
  (load-file user-init-file)
  (message "cfg reloaded :3"))
(global-set-key (kbd "s-r") 'reload-cfg)  ;; reload cfg
(defun open-cfg ()
  "Open my init file."
  (interactive)
  (find-file user-init-file))
(global-set-key (kbd "s-c") #'open-cfg)

;; vanilla gui
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

;; themes
(use-package monokai-theme :ensure t)
(use-package gruvbox-theme :ensure t)
(use-package solarized-theme :ensure t)
(use-package zenburn-theme :ensure t)
(use-package material-theme :ensure t :config)
(use-package base16-theme :ensure t :config)
(use-package modus-themes :ensure t :init)
(use-package ef-themes :ensure t :config)

;;(load-theme 'base16-monokai t)
(load-theme 'base16-catppuccin-mocha t)(set-face-foreground 'font-lock-comment-face "green")
(set-face-foreground 'font-lock-comment-delimiter-face "green")

(set-face-attribute 'default nil
  :font "Lexend"
  :height 140) 
(setq-default line-spacing 0.2)

(use-package ivy :ensure t)
(ivy-mode 1)

(use-package counsel :ensure t)
(global-set-key (kbd "M-t") 'counsel-load-theme)
(global-set-key (kbd "C-M-f") 'counsel-rg)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-b") 'counsel-switch-buffer)
;; Add kill buffer action to counsel-switch-buffer
(with-eval-after-load 'counsel
  (ivy-set-actions
   'counsel-switch-buffer
   '(("k" (lambda (buffer)
            (when (get-buffer buffer)
              (kill-buffer buffer)
              (message "Killed buffer: %s" buffer)))
      "kill buffer"))))
;; Bind C-k to call the kill action in counsel-switch-buffer
(with-eval-after-load 'ivy
  (define-key ivy-minibuffer-map (kbd "C-k")
    (lambda ()
      (interactive)
      (ivy-exit-with-action
       (lambda (buffer)
         (when (get-buffer buffer)
           (kill-buffer buffer)
           (message "Killed buffer: %s" buffer)))))))


(winner-mode 1)

(delete-selection-mode 1) ;; typed text replaces selection

;; smooth scroll
(use-package good-scroll
  :ensure t
  :config
  (good-scroll-mode 1))
(setq good-scroll-step 8)
(setq good-scroll-duration 0.2)
(setq scroll-conservatively 101
	  scroll-margin 8
	  scroll-step 1
	  scroll-preserve-screen-position t)
(setq mouse-wheel-scroll-amount '(1 ((shift) .1)))
(setq mouse-wheel-progressive-speed nil)

(defun esc-deselect-or-winner-undo ()
  "If region is active, deactivate it. Otherwise, run `winner-undo`."
  (interactive)
  (if (use-region-p)
      (deactivate-mark)
    (when (fboundp 'winner-undo)
      (winner-undo))))
(global-set-key (kbd "<escape>") #'esc-deselect-or-winner-undo)

(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

(setq select-enable-clipboard t)

(defun new-scratch-buffer ()
  "Create a new scratch buffer in a new window."
  (interactive)
  (let ((buf (generate-new-buffer "*scratch*")))
    (select-window (split-window-right))
    (switch-to-buffer buf)
    (lisp-interaction-mode)))  ;; or any other mode you prefer
(global-set-key (kbd "C-n") #'new-scratch-buffer)

(defun cancel-or-kill-buffer ()
  "If minibuffer is active, cancel it like `C-g`. Otherwise, kill the current buffer."
  (interactive)
  (if (minibufferp)
      (keyboard-escape-quit)
    (kill-this-buffer)))
(global-set-key (kbd "C-q") #'cancel-or-kill-buffer)

(desktop-save-mode 1)

(editorconfig-mode 1)

(setq-default indent-tabs-mode t)
(setq-default tab-width 4)

(global-set-key (kbd "TAB") #'indent-for-tab-command)

(defun backtab-indent-opposite ()
  "Do the opposite of `indent-for-tab-command`: unindent by `tab-width`."
  (interactive)
  (let ((shift-width (or tab-width 4)))
    (if (use-region-p)
        ;; Dedent region
        (indent-rigidly (region-beginning) (region-end) (- shift-width))
      ;; Dedent current line
      (indent-rigidly (line-beginning-position) (line-end-position) (- shift-width)))))
(global-set-key (kbd "<backtab>") #'backtab-indent-opposite)


(use-package eglot :ensure t)
(add-hook 'c-mode-hook #'eglot-ensure)
(add-hook 'c++-mode-hook #'eglot-ensure)
(add-hook 'python-mode-hook #'eglot-ensure)
(add-to-list 'eglot-server-programs '(c-mode . ("clangd")))
(add-to-list 'eglot-server-programs '(c++-mode . ("clangd")))
(add-to-list 'eglot-server-programs '(python-mode . ("pyright-langserver" "--stdio")))
(add-to-list 'eglot-server-programs '(nim-mode . ("nimlsp")))
(add-to-list 'eglot-server-programs '((js-mode js2-mode typescript-mode tsx-ts-mode) . ("typescript-language-server" "--stdio")))
(add-to-list 'eglot-server-programs '((html-mode web-mode) . ("vscode-html-language-server" "--stdio")))
(add-to-list 'eglot-server-programs '((css-mode scss-mode less-css-mode) . ("vscode-css-language-server" "--stdio")))
(add-to-list 'eglot-server-programs '(go-mode . ("gopls")))
(add-to-list 'eglot-server-programs '(elixir-mode . ("elixir-ls")))
(add-to-list 'eglot-server-programs '(haskell-mode . ("haskell-language-server-wrapper" "--lsp")))
(add-to-list 'auto-mode-alist '("SConstruct\\'" . python-mode))
(add-to-list 'auto-mode-alist '("SConscript\\'" . python-mode))

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
(with-eval-after-load 'company
  (define-key company-active-map (kbd "<tab>") 'company-complete-selection)
  (define-key company-active-map (kbd "M-n") 'company-select-next)
  (define-key company-active-map (kbd "M-p") 'company-select-previous))
(with-eval-after-load 'company
  ;; Unbind arrow keys in company completion popup
  (define-key company-active-map (kbd "<down>") nil)
  (define-key company-active-map (kbd "<up>") nil)
  (define-key company-active-map (kbd "<left>") nil)
  (define-key company-active-map (kbd "<right>") nil))

(add-hook 'eglot-managed-mode-hook #'company-mode)

(use-package projectile
  :ensure t
  :init
  ;; Optional: define project search paths
  (setq projectile-project-search-path '("~/projects/" "~/code/" "~/mygit/"))
  ;; Optional: faster indexing and caching
  (setq projectile-indexing-method 'alien)
  (setq projectile-enable-caching t)
  :config
  ;; Enable projectile globally
  (projectile-mode +1)
  ;; Remap the command map prefix to C-p
  :bind-keymap
  ("C-p" . projectile-command-map))

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
(with-eval-after-load 'swiper
  (define-key swiper-map (kbd "<escape>") #'abort-recursive-edit))

(defun select-current-line ()
  "Select the current line without cutting or killing."
  (interactive)
  (beginning-of-line)
  (push-mark (line-end-position) nil t))
(global-set-key (kbd "C-w") #'my/select-current-line)

(use-package undo-tree :ensure t :init)
(global-undo-tree-mode 1)
(global-set-key (kbd "C-S-z") 'undo-tree-redo)
;; Set directory for undo-tree history files
(defvar my-undo-tree-dir (expand-file-name "~/.emacs.d/undo-tree-history/"))
(unless (file-exists-p my-undo-tree-dir)
  (make-directory my-undo-tree-dir t))
(setq undo-tree-history-directory-alist
      `(("." . ,my-undo-tree-dir)))

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
(global-set-key (kbd "s-d") #'dired-current-file-dir)

(setq dired-auto-revert-buffer t)
(add-hook 'dired-mode-hook 'auto-revert-mode)

;; git
(use-package dired-git-info
  :ensure t
  :hook (dired-mode . dired-git-info-mode))
(use-package diff-hl
  :hook ((dired-mode . diff-hl-dired-mode)
         (magit-post-refresh . diff-hl-magit-post-refresh)))
(global-diff-hl-mode -1)
(setq vc-handled-backends nil)
;; MAX: this is glitching out
;;
;; (use-package blamer
;;   :defer t
;;   :custom
;;   (blamer-idle-time 0.5)
;;   (blamer-min-offset 70)
;;   (blamer-prettify-time-p t)
;;   (blamer-type 'visual)  ;; Show as overlay
;;   :custom-face
;;   (blamer-face ((t :foreground "#7a88cf"
;;                    :background nil
;;                    :height 0.9
;;                    :italic t)))
;;   :hook (prog-mode . blamer-mode))
(add-hook 'prog-mode-hook (lambda () (when (boundp 'blamer-mode) (blamer-mode -1))))

(require 'midnight)
(midnight-mode 1)

;; > FILES
;; Directory to store backup and autosave files
(defvar my-auxiliary-files-dir (expand-file-name "~/.emacs.d/auxiliary/"))
;; Make sure the directory exists
(unless (file-exists-p my-auxiliary-files-dir)
  (make-directory my-auxiliary-files-dir t))
;; Backup files
(setq backup-directory-alist `(("." . ,my-auxiliary-files-dir)))
(setq backup-by-copying t) ;; To avoid issues with symlinks
;; Autosave files
(setq auto-save-file-name-transforms
      `((".*" ,(concat my-auxiliary-files-dir "/\\1") t)))
;; Lock files (those #filename# files that prevent simultaneous editing)
(setq create-lockfiles nil) ;; Optional: disable if annoying

;; MAX: fix C-d overwrite
(with-eval-after-load 'cc-mode
  ;; Unbind electric-c-delete-forward from C-d in cc modes
  (define-key c-mode-map (kbd "C-d") nil)
  (define-key c++-mode-map (kbd "C-d") nil)
  ;; Unbind other keys you find problematic similarly
)

;; vterm fixes
(defun vterm-rebuild-module ()
  "Manually rebuild the vterm native module."
  (interactive)
  (let* ((vterm-dir (file-name-directory (locate-library "vterm.el")))
         (src-dir (expand-file-name "src" vterm-dir))
         (default-directory src-dir))
    (if (file-directory-p src-dir)
        (progn
          (message "Rebuilding vterm native module in %s ..." src-dir)
          (shell-command "make clean && make")
          (message "vterm rebuild done!"))
      (message "vterm source directory not found: %s" src-dir))))
(add-hook 'vterm-mode-hook
          (lambda ()
            ;; Disable visual clutter
            (display-line-numbers-mode -1)
            (good-scroll-mode -1)
            (hungry-delete-mode -1)
            (undo-tree-mode -1)
            (company-mode -1)
            (global-hl-line-mode -1)
            (blink-cursor-mode -1)
            (tooltip-mode -1)

            ;; Reduce line spacing for terminal aesthetics
            (setq-local line-spacing 0)

            ;; Reset font size only (inherits system/default font)
            (setq-local face-remapping-alist '((default :height 1.0)))

            ;; DO NOT override background/foreground of default face
            ;; This keeps vterm ANSI colors untouched

            ;; DO NOT set `vterm-color-cursor` — let theme handle it

            ;; Optional: thinner bar cursor
            (setq-local cursor-type 'bar)))


(require 'server)
(unless (server-running-p) (server-start))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(base16-theme bases16-theme company counsel diff-hl dired-git
				  doom-themes eat ef-themes elixir-mode flycheck gcmh
				  git go-mode good-scroll gruvbox-theme lsp-ui magit
				  material-theme modus-themes monokai-theme
				  multiple-cursors org-superstar pixel-scroll
				  projectile solarized-theme super-save
				  typescript-mode undo-tree web-mode yaml-mode
				  yasnippet zenburn-theme zig-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
