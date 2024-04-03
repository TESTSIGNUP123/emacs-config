(require 'package)
(setq package-enable-at-startup nil)

(setq  package-archives     
	'(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
      	("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
      	("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))

(package-initialize)

(defun use-package (package)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package))
  (package-installed-p package))


;(use-package  'mood-line)
(use-package 'kaolin-themes)
(use-package 'moody)
(use-package 'helm)
;(use-package 'simple-modeline)
(use-package 'all-the-icons)
(use-package 'centaur-tabs)
(use-package 'company)
(use-package 'company-box)
(use-package 'dash)
(use-package 'dashboard)
;(use-package 'eat)
;(use-package 'epl)
(use-package 'flycheck)
(use-package 'frame-local)
(use-package 'leuven-theme)
(use-package 'macrostep)
(use-package 'neotree)
(use-package 'org-bullets)
(use-package 'pkg-info)
;(use-package 'powerline)
(use-package 'projectile)
(use-package 'rich-minority)
(use-package 'slime)
;(use-package 'smart-mode-line)
(use-package 'zenburn-theme)


;;LSP
(use-package 'lsp-mode)
(use-package 'lsp-ui)

(provide 'init-package)
