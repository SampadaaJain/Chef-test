package "apache2" do
  package_name node[:apache][:package]
  action :install
end

service "apache2" do
    service_name "httpd"
    restart_command "/sbin/service httpd restart && sleep 1"
    reload_command "/sbin/service httpd reload && sleep 1"
  action :enable
end

directory node[:apache][:log_dir] do
    mode 0755
    action :create
end

directory "#{node[:apache][:dir]}/ssl" do
  action :create
  mode 0755
  owner "root"
  group node[:apache][:root_group]
end

directory "#{node[:apache][:dir]}/conf.d" do
  action :create
  mode 0755
  owner "root"
  group node[:apache][:root_group]
end

directory node[:apache][:cache_dir] do
  action :create
  mode 0755
  owner "root"
  group node[:apache][:root_group]
end

template "apache2.conf" do
  path "#{node[:apache][:dir]}/conf/httpd.conf"
  source "apache2.conf.erb"
  owner "root"
  group node[:apache][:root_group]
  mode 0644
  notifies :restart, resources(:service => "apache2")
end

template "security" do
  path "#{node[:apache][:dir]}/conf.d/security"
  source "security.erb"
  owner "root"
  group node[:apache][:root_group]
  mode 0644
  backup false
  notifies :restart, resources(:service => "apache2")
end

template "#{node[:apache][:dir]}/ports.conf" do
  source "ports.conf.erb"
  owner "root"
  group node[:apache][:root_group]
  variables :apache_listen_ports => node[:apache][:listen_ports].map{|p| p.to_i}.uniq
  mode 0644
  notifies :restart, resources(:service => "apache2")
end

template "#{node[:apache][:dir]}/sites-available/default" do
  source "default-site.erb"
  owner "root"
  group node[:apache][:root_group]
  mode 0644
  notifies :restart, resources(:service => "apache2")
end

service "apache2" do
  action :start
end