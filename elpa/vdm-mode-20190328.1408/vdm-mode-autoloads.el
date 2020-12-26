;;; vdm-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "vdm-mode" "vdm-mode.el" (0 0 0 0))
;;; Generated autoloads from vdm-mode.el

(let* ((vdm-files '(".vdmsl" ".vsl" ".vdmpp" ".vpp" ".vdmrt" ".vrt")) (vdm-regexp (concat (regexp-opt vdm-files t) "\\'"))) (add-to-list 'auto-mode-alist (cons vdm-regexp 'vdm-mode)))

(autoload 'vdm-mode "vdm-mode" "\


\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vdm-mode" '("vdm-mode-")))

;;;***

;;;### (autoloads nil "vdm-mode-util" "vdm-mode-util.el" (0 0 0 0))
;;; Generated autoloads from vdm-mode-util.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vdm-mode-util" '("vdm-mode-util-")))

;;;***

;;;### (autoloads nil nil ("vdm-mode-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; vdm-mode-autoloads.el ends here
