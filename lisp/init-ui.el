; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)
;; 关闭文件滑动控件
;(scroll-bar-mode -1)

;;Time
(display-time-mode 1) 
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

 (menu-bar-mode 0) 
(setq make-backup-files nil)
(when (display-graphic-p) (toggle-scroll-bar -1)) ;;滚动条
(column-number-mode t)  
;; 显示行号
(global-display-line-numbers-mode 1)
(setq linum-format "%d> ")
;(global-linum-mode 1)
;(require 'linum-relative)
;(linum-relative-on)
;(linum-on)
;(linum-relative-toggle)
;(setq linum-relative-backend 'display-line-numbers-mode)
;; 更改光标的样式（不能生效，解决方案见第二集）
(setq cursor-type 'bar)
(icomplete-mode 1)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)
(fset 'yes-or-no-p 'y-or-n-p)


;;Fonts
(set-face-attribute 'default nil :font "monaco 16")

;; 快速打开配置文件
(defun open-init-file()
 (interactive)
  (find-file "~/.emacs.d/init.el"))
;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

;;启动

(require 'dashboard)
(dashboard-setup-startup-hook)
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
(setq dashboard-center-content t)
(setq dashboard-show-shortcuts nil)
(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
                        (registers . 5)))

;;Projectie
(projectile-mode +1)
;; Recommended keymap prefix on macOS
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;; Recommended keymap prefix on Windows/Linux
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)


;;Mode

;(setq x-underline-at-descent-line t)
;(moody-replace-mode-line-buffer-identification)
;(moody-replace-vc-mode)
;  (moody-replace-eldoc-minibuffer-message-function

;(let ((line (face-attribute 'mode-line :underline)))
 ;   (set-face-attribute 'mode-line          nil :overline   line)
  ;  (set-face-attribute 'mode-line-inactive nil :overline   line)
  ; (set-face-attribute 'mode-line-inactive nil :underline  line)
  ; (set-face-attribute 'mode-line          nil :box        nil)
   ; (set-face-attribute 'mode-line-inactive nil :box        nil)
   ; (set-face-attribute 'mode-line-inactive nil :background "#f9f2d9")))

;;Doom

;;Theme
(load-theme 'leuven t)                 
(setq leuven-scale-outline-headlines nil)
(setq leuven-scale-org-agenda-structure nil)
(setq leuven-scale-volatile-highlight nil)
;(load-theme 'zenburn t)
;(load-theme 'srcery t)

;(require 'kaolin-themes)
;(load-theme 'kaolin-dark t)
;(kaolin-treemacs-theme)

;(load-theme 'nano t)
;(nano-dark)

;;顶部TAB
(require 'centaur-tabs)
(centaur-tabs-mode t)
(global-set-key (kbd "C-g")  'centaur-tabs-backward)
(global-set-key (kbd "C-h") 'centaur-tabs-forward)

;;NeoTREE
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;;helm
(require 'helm)
(require 'helm-autoloads)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)
;(find-file-read-only . ido)

;;透明
(set-frame-parameter nil 'alpha '(90 . 100))
;;icons

(require 'all-the-icons)
(display-graphic-p)
(insert (all-the-icons-icon-for-file "foo.js"))

(provide 'init-ui)
