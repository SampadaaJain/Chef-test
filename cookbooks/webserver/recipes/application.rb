directory "#{node[:apache][:app][:dir]}" do
  action :create
  mode 0755
  owner "root"
  group node[:apache][:root_group]
end

directory "#{node[:apache][:app][:log_dir]}" do
  action :create
  mode 0755
  owner "root"
  group node[:apache][:root_group]
end

git "#{node[:apache][:app][:dir]}/index.html" do
  repository node[:apache][:git_repository]
  revision node[:apache][:git_revision]
  action :sync
  notifies :restart, resources(:service => "apache2")
end

