(defun current-indent-size
 ()
 "Return the horizontal position of the first non-whitespace
character on the current line. The first position is 0."
 (interactive)
 (save-excursion
   (back-to-indentation)
   (current-column)))


(defun beginning-of-indent-or-line ()
  (interactive)
  (let ((indent-size (current-indent-size)))
    (cond ((> (current-column) indent-size) (back-to-indentation))
          ((= (current-column) indent-size) (beginning-of-line))
          ((= (current-column) 0) (back-to-indentation))
          (t (beginning-of-line)))))
(provide 'indent-or-beginning)
