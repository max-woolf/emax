
;;
;; >_<
;; emax
;;
;; emacs keys
;;   'C-' -> Control
;;   'M-' -> Alt
;;   's-' -> Super
;;   'S-' -> Shift
;;
;; OwO
;;

;; disable gui
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;; settings - general
(column-number-mode 1)                             ;; show line num on bottom
(show-paren-mode 1)                                ;; highlights ()
(global-hl-line-mode 1)                            ;; highlight current line
(global-display-line-numbers-mode 1)               ;; show line num on left
(load-theme 'doom-dark+ t)                         ;; load default theme
(setq shift-select-mode t)                         ;; holding shift and using arrows selects stuff
(recentf-mode 1)                                   ;; recent files
(savehist-mode 1)                                  ;; command history, search inputs, etc
(save-place-mode 1)                                ;; remembers cursor position in files
(global-auto-revert-mode 1)                        ;; reload when file changed on disk
(delete-selection-mode 1)                          ;; typed text replaces selection
(winner-mode 1)                                    ;; undo/redo of window configurations
(desktop-save-mode 1)                              ;; saves and restores emacs sessions
(editorconfig-mode 1)                              ;; .editorconfig

;; settings - keys
;;
;; > gnome key repeat (run this on terminal)
;;
;;     gsettings set org.gnome.desktop.peripherals.keyboard delay 300
;;     gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30
;;
(setq auto-repeat-mode t)                          ;; Enable key repeat
(setq repeat-delay 0.005)                          ;; Short delay before repeating starts
(setq repeat-interval 0.005)                       ;; Time between repeats
(setq echo-keystrokes 0.005)                       ;; Reduce keystroke echo delay
(setq jit-lock-defer-time 0)                       ;; No delay in font-lock (helps responsiveness)
(setq auto-repeat-mode nil)                        ;; disable Emacs repeat mode
;; optional for Emacs 29+
(when (boundp 'keyboard-repeat-rate)
  (setq keyboard-repeat-rate 10))

;; settings - indentation
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)

;; settings - scroll
(setq scroll-margin 5)
(setq hscroll-step 1)
(setq scroll-step 1)
(setq scroll-conservatively 101)
(setq auto-window-vscroll nil)
(setq scroll-preserve-screen-position t)

;; binds - general
(global-set-key (kbd "C-s") 'save-buffer)				;; save file
(global-set-key (kbd "C-v") 'yank)						;; paste
(define-prefix-command 'my-C-c-map)
(global-set-key (kbd "C-c") 'my-C-c-map)
(global-set-key (kbd "C-c C-c") 'my/copy-or-cancel)
(global-set-key (kbd "C-c c") 'my/copy-or-cancel)
;;(global-set-key (kbd "C-c C-c") 'kill-ring-save)		;; copy
(global-set-key (kbd "C-z") 'undo)						;; undo
(global-set-key (kbd "C-r") 'undo-tree-redo)			;; redo
(global-set-key (kbd "M-r") 'reload-init-file)			;; reload cfg
(global-set-key (kbd "s-r") 'reload-init-file)			;; reload cfg
(global-set-key (kbd "C-a") 'mark-whole-buffer)			;; select all
(global-set-key (kbd "M-c") 'open-config)				;; open cfg
(global-set-key (kbd "M-t") 'counsel-load-theme)		;; open theme menu
(global-set-key (kbd "C-d") 'kill-whole-line)			;; cut line
(global-set-key (kbd "C-c s") 'copy-current-line)		;; copy line
(global-set-key (kbd "C-c C-s") 'copy-current-line)		;; copy line
(global-set-key (kbd "TAB") 'indent-for-tab-command)	;; make TAB do indentation
(global-set-key (kbd "C-c v") 'yank-below)				;; paste below
(global-set-key (kbd "s-t") 'open-eat)                  ;; open terminal  
(global-set-key (kbd "s-q") 'save-and-quit-buffer)      ;; save and quit
(global-set-key (kbd "s-k") 'kill-this-buffer)

;; binds - movement
(global-set-key (kbd "C-<left>") 'backward-word)
(global-set-key (kbd "C-<right>") 'forward-word)
(global-set-key (kbd "C-<up>") 'backward-paragraph)
(global-set-key (kbd "C-<down>") 'forward-paragraph)
;; move to end of line
(global-set-key (kbd "M-<left>") 'move-beginning-of-line)
(global-set-key (kbd "M-<right>") 'move-end-of-line)
;; move to end of buffer
;;(global-set-key (kbd "M-<up>") 'beginning-of-buffer)
;;(global-set-key (kbd "M-<down>") 'end-of-buffer)

;; binds - search
(global-set-key (kbd "C-f") 'swiper)        ;; fuzzy search in current buffer
(global-set-key (kbd "C-M-f") 'counsel-rg)  ;; fuzzy search across project (ripgrep)
(global-set-key (kbd "M-x") 'counsel-M-x)   ;; fuzzy M-x
(global-set-key (kbd "s-b") 'counsel-switch-buffer) ;; buffers

;; binds - tools
(global-set-key (kbd "s-t") 'open-eat)
(global-set-key (kbd "s-e") 'eshell)
;; binds - split window
(global-set-key (kbd "C-s-<left>")  (lambda () (interactive) (split-window-right)  (windmove-right)))
(global-set-key (kbd "C-s-<right>") (lambda () (interactive) (split-window-right)  (windmove-right)))
(global-set-key (kbd "C-s-<up>")    (lambda () (interactive) (split-window-below)  (windmove-down)))
(global-set-key (kbd "C-s-<down>")  (lambda () (interactive) (split-window-below)  (windmove-down)))
;; switch windows
(global-set-key (kbd "M-s-<left>") 'windmove-left)
(global-set-key (kbd "M-s-<right>") 'windmove-right)
(global-set-key (kbd "M-s-<up>") 'windmove-up)
(global-set-key (kbd "M-s-<down>") 'windmove-down)
;; manip windows 
(global-set-key (kbd "s-q") 'delete-window)

;; binds - dir navigation
(global-set-key (kbd "S-s-d")  (lambda () (interactive) (dired "$HOME/"))) ;; open dired in home dir
(global-set-key (kbd "s-d") 'open-dired-here) ;; open dired in current dir
(with-eval-after-load 'dired  (define-key dired-mode-map (kbd ".") 'dired-up-directory)) ;; go back with ..

;; functions
(defun reload-init-file ()
  "Reload Emacs configuration file."
  (interactive)
  (load-file user-init-file)
  (message "cfg reloaded :3"))

(defun open-config ()
  "Open my init file."
  (interactive)
  (find-file user-init-file))

(defun copy-current-line ()
  "Copy the current line to the kill ring."
  (interactive)
  (kill-ring-save (line-beginning-position) (line-beginning-position 2))
  (message "Line copied!"))

(defun yank-below ()
  "Paste/yank text on a new line below the current line."
  (interactive)
  (end-of-line)
  (newline)
  (yank))

(defun save-and-quit-buffer ()
  "Save the current buffer and kill it."
  (interactive)
  (when (buffer-file-name)
    (save-buffer))
  (kill-this-buffer))

(defun my/copy-or-cancel ()
  "Copy region if active, otherwise cancel (like `keyboard-quit`)."
  (interactive)
  (if (use-region-p)
      (progn
        (kill-ring-save (region-beginning) (region-end))
        (message "Copied"))
    (keyboard-quit)))

(defun open-eat ()
  "Open EAT terminal in a buffer."
  (interactive)
  (eat "*eat*"))

(defun my/eat-auto-close ()
  (let ((buf (current-buffer)))
    (when (not (eat-running-p))
      (kill-buffer buf))))
(add-hook 'eat-exit-hook 'my/eat-auto-close)

(defun open-dired-here ()
  "Open Dired in the directory of the current buffer."
  (interactive)
  (dired (or (file-name-directory (or (buffer-file-name) default-directory))
             default-directory)))

;; ;; START: programming

(setq lisp-indent-offset 2)
(setq elisp-basic-offset 2)

(defun c-tabs-hook ()
  ;; Set basic indentation level to 4 spaces
  (c-set-style "linux")
  (setq c-basic-offset 4)          ;; Indentation level
  (setq c-indent-level 4)          ;; Indentation level for C
  (setq indent-tabs-mode t)        ;; Use tabs instead of spaces
  (setq tab-width 4)               ;; Set tab width to 4
  (setq c-tab-always-indent t)     ;; Always indent with tab
  (setq c++-tab-always-indent t)   ;; Always indent with tab for C++
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close 0)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'innamespace 0)    ;; No extra indentation for namespaces
  (setq-local show-trailing-whitespace t)) ;; Show trailing whitespace

(add-hook 'c-mode-hook 'c-tabs-hook)

;; END

;; ;; START: package manager

;; init package.el and add MELPA
(require 'package)

(setq package-enable-at-startup nil) ;; Prevent double initialization
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

;; Optional: refresh package contents if none are available
(unless package-archive-contents
  (package-refresh-contents))

;; If you want, you can install/use-package automatically:
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t) ;; Always install missing packages

;; END

;; ;; START: Packages

;; themes
(use-package doom-themes
  :ensure t
  :config
  ;; Optional: extra doom theme configs for org etc.
  (doom-themes-org-config))
(use-package doom-themes
  :ensure t)
(use-package gruvbox-theme
  :ensure t)
(use-package monokai-theme
  :ensure t)
(use-package solarized-theme
  :ensure t)
(use-package zenburn-theme
  :ensure t)
(use-package material-theme
  :ensure t
  :config)
  
(use-package ivy
  :ensure t
  :init (ivy-mode 1)
  :config
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

(use-package counsel
  :ensure t)

(use-package swiper
  :ensure t)

;; redo
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

;; which key?
(use-package which-key
  :ensure t
  :init
  (which-key-mode)
  :config
  (setq which-key-idle-delay 0.3)) ;; adjust delay

;; autosave
(use-package super-save
  :ensure t
  :config
  (super-save-mode +1)
  (setq super-save-auto-save-when-idle t)      ;; enable idle auto-save
  (setq super-save-idle-duration 3)            ;; seconds of idle before save
  (setq super-save-silent t))                  ;; suppress messages

;; smooth scroll
(use-package good-scroll
  :ensure t
  :config
  (good-scroll-mode 1))

;; terminal emulator
;;(use-package vterm
;;  :ensure t)

(use-package eat
  :ensure t
  :hook (eshell-load . eat-eshell-mode)
  :config
  (eat-eshell-mode 1))

(use-package dired
  :ensure nil ;; built-in
  :commands (dired dired-jump)
  :config
  (setq dired-listing-switches "-alh")) ;; human-readable sizes

(add-hook 'dired-mode-hook 'auto-revert-mode) ;; dired: auto-update filechanges

(use-package diff-hl
  :ensure t
  :hook ((prog-mode . diff-hl-mode)
         (dired-mode . diff-hl-dired-mode)
         (magit-post-refresh . diff-hl-magit-post-refresh))
  :config
  (diff-hl-flydiff-mode 1)) ;; update on-the-fly

;; END

;; ;; START: servers

;; start server mode
(require 'server)
(unless (server-running-p)
  (server-start))

;; END

;; ;; START: Auto-generated

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
	'(counsel diff-hl doom-themes eat gruvbox-theme monokai-theme
	   solarized-theme super-save undo-tree zenburn-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; END

;; == FINAL
