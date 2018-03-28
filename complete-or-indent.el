(defun complete-or-indent ()
  ;; Completes or indents, based on what works
    (interactive)
    (if (company-manual-begin)
        (company-complete-common)
      (indent-according-to-mode)))
(provide 'complete-or-indent)
