;;Company-MODE
(add-hook 'after-init-hook 'global-company-mode)
(require 'company-box)
(add-hook 'company-mode-hook 'company-box-mode)
 (setq company-minimum-prefix-length 1) ; 只需敲 1 个字母就开始进行自动补全
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.0)
  (setq company-show-numbers t) ;; 给选项编号 (按快捷键 M-1、M-2 等等来进行选择).
  (setq company-selection-wrap-around t)
 (setq company-transformers '(company-sort-by-occurrence))  ; 根据选择的频率进行排序，读者如果不喜欢可以去掉

;；Lsp
(require 'lsp-mode)
(require 'lsp-ui)
(require 'lsp-ui-imenu)

(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
(define-key lsp-ui-mode-map (kbd "C-c C-l .") 'lsp-ui-peek-find-definitions)
(define-key lsp-ui-mode-map (kbd "C-c C-l ?") 'lsp-ui-peek-find-references)
(define-key lsp-ui-mode-map (kbd "C-c C-l r") 'lsp-rename)
(define-key lsp-ui-mode-map (kbd "C-c C-l x") 'lsp-workspace-restart)
(define-key lsp-ui-mode-map (kbd "C-c C-l w") 'lsp-ui-peek-find-workspace-symbol)
(define-key lsp-ui-mode-map (kbd "C-c C-l i") 'lsp-ui-peek-find-implementation)
(define-key lsp-ui-mode-map (kbd "C-c C-l d") 'lsp-describe-thing-at-point)
(define-key lsp-ui-mode-map (kbd "C-c C-l e") 'lsp-execute-code-action)

;(setq lsp-ui-sideline-enable t)
(setq lsp-ui-doc-enable t)
(setq lsp-ui-peek-enable t)
(setq lsp-ui-peek-always-show t)
;;langers
(add-hook 'c++-mode-hook #'lsp)
(add-hook 'js-mode #'lsp)
(add-hook 'python-mode-book #'lsp)

(global-flycheck-mode)
;(setq truncate-lines nil) 
;(prog-mode . flycheck-mode)

;;shell-color
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;;CommonLisp
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))
(slime-setup)
(require 'slime)
(require 'slime-autoloads)
(slime-setup '(slime-fancy slime-banner))


(provide 'init-code)
