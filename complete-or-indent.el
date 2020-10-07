(defun indent-or-complete ()
  ;; not sure anymore what this does and/or why
    (interactive)
    (if (looking-at "\\_>")
        (company-complete-common)
      (indent-according-to-mode)))

(defun complete-or-indent ()
  ;; Completes or indents, based on what works
    (interactive)
    (if (company-manual-begin)
        (company-complete-common)
      (indent-according-to-mode)))
(provide 'complete-or-indent)
