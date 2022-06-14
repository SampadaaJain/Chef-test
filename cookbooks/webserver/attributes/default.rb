#
# Cookbook Name:: apache2
# Attributes:: apache
#
#
default[:apache][:package]  = "httpd"
default[:apache][:dir]     = "/etc/httpd"
default[:apache][:log_dir] = "/var/log/httpd"
default[:apache][:user]    = "apache"
default[:apache][:group]   = "apache"
default[:apache][:cache_dir] = "/var/cache/httpd"
default[:apache][:pid_file] = "/var/run/httpd/httpd.pid"

default[:apache][:root_group]  = "root"

###
# These settings need the unless, since we want them to be tunable
###

# General settings
default[:apache][:listen_ports] = [ "80","443" ]
default[:apache][:contact] = "ops@example.com"
default[:apache][:timeout] = 300
default[:apache][:keepalive] = "On"
default[:apache][:keepaliverequests] = 100
default[:apache][:keepalivetimeout] = 5

# Security
default[:apache][:servertokens] = "dev"
default[:apache][:serversignature] = "On"
default[:apache][:traceenable] = "On"

#Application
default[:apache][:app][:dir] = "/var/www/html"
default[:apache][:app][:log_dir] = "/var/www/log"