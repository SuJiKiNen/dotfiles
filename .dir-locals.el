;; avoid submodules ignore dirty
;; see https://github.com/magit/magit/issues/3555
((magit-status-mode
  (magit-diff-section-arguments
   . ("--ignore-submodules=dirty")))
 (magit-diff-mode
  (magit-diff-arguments
   . ("--ignore-submodules=dirty"
      "--stat" "-M" "--diff-algorithm=patience"))))
