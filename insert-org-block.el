(defun org-insert-block-above ()
  ;; Insert org-mode block either:
  ;; (a) above the current block (point needs to be inside a block)
  ;;     uses same block type/header args as current block
  ;; (b) at point, using the same block type/header args as the previous block
  (interactive)
  (let ((line (thing-at-point 'line))
        startline
        endline)
    (if (org-in-block-p '("src" "export" "center" "comment" "example" "quote" "verse"))
        (progn
          (if (string-match-p "#\\+begin" line)
              (setq startline line)
            (org-previous-block 1)
            (setq startline (thing-at-point 'line)))
          (save-excursion
            (re-search-forward "#\\+end")
            (setq endline (thing-at-point 'line)))
          (open-line 2))
      (save-excursion
        (org-previous-block 1)
        (setq startline (thing-at-point 'line))
        (re-search-forward "#\\+end")
        (setq endline (thing-at-point 'line))))
    (insert startline)
    (insert endline)
    (kill-line)
    (previous-line)))

(defun org-insert-block-below ()
  ;; Insert org-mode block either:
  ;; (a) below the current block (point needs to be inside a block)
  ;;     uses same block type/header args as current block
  ;; (b) at point, using the same block type/header args as the next block
  (interactive)
  (let ((line (thing-at-point 'line))
        startline
        endline)
    (if (org-in-block-p '("src" "export" "center" "comment" "example" "quote" "verse"))
        (progn
          (if (string-match-p "#\\+begin" line)
              (setq startline line)
            (org-previous-block 1)
            (setq startline (thing-at-point 'line)))
          (re-search-forward "#\\+end")
          (setq endline (thing-at-point 'line))
          (end-of-line)
          (newline 2))
      (save-excursion
        (org-next-block 1)
        (setq startline (thing-at-point 'line))
        (re-search-forward "#\\+end")
        (setq endline (thing-at-point 'line))))
    (insert startline)
    (insert endline)
    (kill-line)
    (previous-line)))

(provide 'insert-org-block)
