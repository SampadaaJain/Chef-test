#
# Cookbook:: ps_apache
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

package "apache2" do
  package_name node[:ps_apache][:package]
  action :install
end

package "git"

service "apache2" do
  service_name "httpd"
  #restart_command "/sbin/service httpd restart && sleep 1"
  #reload_command "/sbin/service httpd reload && sleep 1"
end

cookbook_file "/root/.ssh/#{node[:ps_apache][:rsa]}" do
  source 'id_rsa_git'
  mode '0600'
  owner "ec2-user"
end

execute 'git ssh' do 
  command 'export GIT_SSH_COMMAND="ssh -i /root/.ssh/id_rsa.pub -o \"StrictHostKeyChecking=no\" " '
end

execute 'update index.html' do
  command "cp -f /root/test_Chef_HTML/index.html #{node[:ps_apache][:app][:dir]}/index.html"
  action :nothing
  #notifies :restart, resources(:service => "apache2")
end

#ssh_known_hosts_entry 'github.com'

git "/root/test_Chef_HTML" do
  repository node[:ps_apache][:git_repository]
  revision node[:ps_apache][:git_revision]
  action :sync
  notifies :run, resources(:execute => "update index.html")
end

