Description
===========

This cookbook provides a sample Apache HTTPD configuration. 


Requirements
============

## Cookbooks:

This cookbook doesn't have direct dependencies on other cookbooks. This is the sample prototype cookbook with many Assumptions made(Refer assumptions page)

On RHEL, SELinux is enabled by default. The `selinux` cookbook contains a `permissive` recipe that can be used to set SELinux to "Permissive" state.

The easiest but certainly not ideal way to deal with IPtables is of course to flush all rules. Opscode does provide an `iptables` cookbook but is migrating from the approach used there to a more robust solution utilizing a general "firewall" LWRP that would have an "iptables" provider. Alternately, you can use ufw, with Opscode's `ufw` and `firewall` cookbooks to set up rules. See those cookbooks' READMEs for documentation.

Build/compile tools may not be installed on the system by default. Some recipes (e.g., `apache2::mode_auth_openid`) build the module from source. Use Opscode's `build-essential` cookbook to get essential build packages installed.

## Platforms:


* Red Hat/CentOS(RHEL Family)


### Notes for RHEL Family:

Attributes
==========

This cookbook uses many attributes, broken up into a few different kinds.

Platform specific
-----------------

See the attributes/default.rb file for assumed default values.

* `node['apache']['dir']` - Location for the Apache configuration
* `node['apache']['log_dir']` - Location for Apache logs
* `node['apache']['user']` - User Apache runs as
* `node['apache']['group']` - Group Apache runs as
* `node['apache']['binary']` - Apache httpd server daemon
* `node['apache']['cache_dir']` - Location for cached files used by Apache itself or recipes
* `node['apache']['pid_file']` - Location of the PID file for Apache httpd

General settings
----------------

These are general settings used in recipes and templates. Default values are noted.

* `node['apache']['listen_ports']` - Ports that httpd should listen on. Default is an array of ports 80 and 443.
* `node['apache']['contact']` - Value for ServerAdmin directive. Default "ops@example.com".
* `node['apache']['timeout']` - Value for the Timeout directive. Default is 300.
* `node['apache']['keepalive']` - Value for the KeepAlive directive. Default is On.
* `node['apache']['keepaliverequests']` - Value for MaxKeepAliveRequests. Default is 100.
* `node['apache']['keepalivetimeout']` - Value for the KeepAliveTimeout directive. Default is 5.
* `node['apache']['default_modules']` - Array of module names. Can take "mod_FOO" or "FOO" as names, where FOO is the apache module, e.g. "`mod_status`" or "`status`".


Recipes
=======

default
-------

The default recipe sets up Apache HTTPd.