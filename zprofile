# /etc/zprofile has just run `path_helper`, which demoted everything ~/.zshenv
# put on PATH below the system directories. Apply the prepends again so they win.
prepend_path
