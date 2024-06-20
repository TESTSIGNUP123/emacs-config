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
;(require 'lsp-mode)
;(require 'lsp-ui)
;(require 'lsp-ui-imenu)

;(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
;(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
;(define-key lsp-ui-mode-map (kbd "C-c C-l .") 'lsp-ui-peek-find-definitions)
;(define-key lsp-ui-mode-map (kbd "C-c C-l ?") 'lsp-ui-peek-find-references)
;(define-key lsp-ui-mode-map (kbd "C-c C-l r") 'lsp-rename)
;(define-key lsp-ui-mode-map (kbd "C-c C-l x") 'lsp-workspace-restart);
;(define-key lsp-ui-mode-map (kbd "C-c C-l w") 'lsp-ui-peek-find-workspace-symbol)
;(define-key lsp-ui-mode-map (kbd "C-c C-l i") 'lsp-ui-peek-find-implementation)
;(define-key lsp-ui-mode-map (kbd "C-c C-l d") 'lsp-describe-thing-at-point)
;(define-key lsp-ui-mode-map (kbd "C-c C-l e") 'lsp-execute-code-action)

;(setq lsp-ui-sideline-enable t)
;(setq lsp-ui-doc-enable t)
;(setq lsp-ui-peek-enable t)
;(setq lsp-ui-peek-always-show t)
;;langers
;(add-hook 'c++-mode-hook #'lsp)
;(add-hook 'js-mode #'lsp)
;(add-hook 'python-mode-book #'lsp)
;(add-hook 'typescript-mode #'lsp)

;(global-flycheck-mode)
;(setq truncate-lines nil) 
;(prog-mode . flycheck-mode)

;;lsp-java
;(require 'lsp-java)
;(add-hook 'java-mode-hook #'lsp)
;(add-hook 'java-mode-hook (lambda ()
;                            (setq c-default-style "java")
 ;                           (setq c-basic-offset 4)
  ;                          (display-line-numbers-mode t)
   ;                         (gradle-mode 1)
    ;                        ))

;;ts;
;(defun my-setup-dap-node ()
;  "Require dap-node feature and run dap-node-setup if VSCode module isn't already installed"
 ; (require 'dap-node)
  ;(unless (file-exists-p dap-node-debug-path) (dap-node-setup)))

;(add-hook 'typescript-mode-hook 'my-setup-dap-node)
;(add-hook 'javascript-mode-hook 'my-setup-dap-node)
;(require 'dap-node)

 ;(if (file-exists-p (nth 1 dap-node-debug-program))
 ;    (message "NodeJS debugger successfully installed")
  ;(message "NodeJS debugger install failed. Please download it manually"))

(add-hook 'typescript-mode-hook 'lsp)
(add-hook 'javascript-mode-hook 'lsp)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)
(add-hook 'elisp-byte-code-mode-hook 'lsp)
;lsp-bridge
;(require 'yasnippet)
;(yas-global-mode 1)

;(require 'lsp-bridge)
;(global-lsp-bridge-mode)

;;LSP-bridge
(add-to-list 'load-path "~/.emacs.d/elpa/lsp-bridge")
(require 'yasnippet)
(yas-global-mode 1)

(require 'lsp-bridge)
(global-lsp-bridge-mode)

(defun enable-lsp-bridge()
  (when-let* ((project (project-current))
              (project-root (nth 2 project)))
    (setq-local lsp-bridge-user-langserver-dir project-root
                lsp-bridge-user-multiserver-dir project-root))
  (lsp-bridge-mode))

;; lsp-bridge first try `lsp-bridge--get-multi-lang-server-func', then try `lsp-bridge--get-single-lang-server-func'
;; So we need remove `ts' and `tsx' setting from default value of lsp-bridge-multi-lang-server-extension-list.
(setq lsp-bridge-multi-lang-server-extension-list
      (cl-remove-if (lambda (item)
                      (equal (car item) '("ts" "tsx")))
                    lsp-bridge-multi-lang-server-extension-list))

;; Last we customize `lsp-bridge-get-single-lang-server-by-project' to return `deno' lsp server name.
;; I recommand you write some code to compare project-path or file-path, return `deno' only if match target path.
(setq lsp-bridge-get-single-lang-server-by-project
      (lambda (project-path file-path)
	(when (or (string-suffix-p ".ts" file-path)
		  (string-suffix-p ".tsx" file-path))
	  "deno")))




;;shell-color
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;;CommonLisp
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))
(slime-setup)
(require 'slime)
(require 'slime-autoloads)
(slime-setup '(slime-fancy slime-banner))

;;Html
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;;lua
;(require 'lua-mode)
  ; (autoload 'lua-mode "lua-mode" "Lua editing mode." t)
  ;  (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
   ; (add-to-list 'interpreter-mode-alist '("lua" . lua-mode)

(provide 'init-code)
