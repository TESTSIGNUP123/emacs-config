(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Package Management
;; -----------------------------------------------------------------
(require 'init-package)
(require 'init-ui)
(require 'init-code)
(require 'init-org)
;(require 'init-exwm)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("95a42228b41b0118af4d6668ccebd4e9696775fc9734a1afb361cfb5dd80e0b8"
     default))
 '(package-selected-packages
   '(all-the-icons centaur-tabs company-box dashboard flycheck helm
		   kaolin-themes leuven-theme lsp-ui moody neotree
		   org-bullets org-real pkg-info projectile
		   rich-minority slime zenburn-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
