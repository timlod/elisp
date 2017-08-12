# elisp
Some elisp functions I write very rarely.

## toggle-case-initial
This function toggles the case of the first character in a word.
I find this useful to e.g. quickly export/unexport something in go (where the case of a function determines whether it will be exported).

Works when the cursor is on any character of the word or one position right of the word (e.g. on a dot, question mark etc.).
I bind it to C-c like such:

<code>(global-set-key (kbd "C-c c") 'toggle-case-initial)</code>
