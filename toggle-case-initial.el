(defun toggle-case-initial(d)
  "Toggles the case of the first letter of the word under the cursor."
  (interactive "d")
  ;; interactive means we can call this from the outside, "d" returns the cursor point as the
  ;; parameter d.
  (skip-chars-backward "a-zA-Z0-9")
  ;; we skip backwards from the point, over all letters/numbers.
  (let (p ch)
    ;; we create a scope for point p and ch and set them.
    (setq p (point))
    (setq ch (buffer-substring p (+ p 1)))
    ;; next is a conditional (like if elseif elseif...) that checks whether the character at the
    ;; beginning of the word is uppercase or lowercase, and switches this.
    (cond
     ((string= ch (upcase ch))
      (delete-char 1)
      (insert (downcase ch))
      ;; go back a char because insertion moves the point forward
      (backward-char 1))
     ((string= ch (downcase ch))
      (delete-char 1)
      (insert (upcase ch)))))
  (goto-char d))
;; return cursor to the original point

(provide 'toggle-case-initial)
