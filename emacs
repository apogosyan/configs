(setq initial-scratch-message "")
(setq inhibit-startup-message t)
(setq visible-bell 0)
(setq ring-bell-function 'ignore)
(blink-cursor-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)
(set-default-font "Inconsolata 11")
(column-number-mode t)
(line-number-mode t)
;(setq mac-command-modifier 'meta)
;(setq mac-option-modifier 'meta)
(setq-default indent-tabs-mode nil)
(load-theme 'tango-dark)

(setq show-paren-delay 0)
(show-paren-mode 1)


(defun fs ()
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(defun my:window-setup-hook ()
 (when window-system
   (set-frame-size (selected-frame) 80 45)))
(setq window-setup-hook 'my:window-setup-hook)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(elpy-enable)

(add-to-list 'exec-path "/usr/local/bin")

(global-set-key (kbd "M-n") 'forward-sexp)
(setq x-super-keysym 'meta)

(setq
 backup-by-copying t
 backup-directory-alist
 '(("." . "~/.autosave"))
 delete-old-versions t
 kept-new-versions 10
 kept-old-versions 10
 version-control t)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(defvar fullscreen nil)

(global-set-key (kbd "<C-tab>") 'other-window)
(global-set-key [C-S-tab] 
    (lambda ()
      (interactive)
      (other-window -1)))

(defun jumpy ()
  (interactive)
  (message "Starting jumpy!"))
  
(global-set-key (kbd "<M-RET>") 'jumpy)
(global-set-key (kbd "M-\\") 'neotree-toggle)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (scss-mode cider slime web-mode neotree elpy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-engines-alist
      '(("django"    . "\\.html\\'"))
)

(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

(defun my-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
)

(setq web-mode-enable-current-element-highlight t)

;(setq web-mode-enable-current-column-highlight t)

(add-hook 'web-mode-hook  'my-web-mode-hook)      

(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))
