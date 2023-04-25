(package "treemacs"
         "3.1"
         "A tree style file explorer package")

(website-url "https://github.com/Alexander-Miller/treemacs")

(package-file "src/elisp/treemacs.el")
(files "src/elisp/*.el" "src/extra/*.el")

(script "test" "echo \"Error: no test specified\" && exit 1")

(source 'gnu)
(source 'melpa)

(depends-on "dash")
(depends-on "s")
(depends-on "ace-window")
(depends-on "pfuture")
(depends-on "hydra")
(depends-on "ht")
(depends-on "cfrs")

(development
 (depends-on "all-the-icons")
 (depends-on "evil")
 (depends-on "projectile")
 (depends-on "magit")
 (depends-on "persp-mode")
 (depends-on "perspective")
 (depends-on "with-editor")
 (depends-on "buttercup")
 (depends-on "el-mock")
 (depends-on "ert-runner"))

(setq network-security-level 'low)  ; see https://github.com/jcs090218/setup-emacs-windows/issues/156#issuecomment-932956432
