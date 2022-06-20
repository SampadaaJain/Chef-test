
default[:ps_apache][:package] = "httpd"
default[:ps_apache][:app][:dir] = "/var/www/html"
default[:ps_apache][:git_repository] = "git@github.com:SampadaaJain/test_Chef_HTML.git"
default[:ps_apache][:git_revision] = "main"
default[:ps_apache][:rsa] = "id_rsa"
