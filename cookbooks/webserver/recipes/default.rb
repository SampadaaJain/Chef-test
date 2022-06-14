apache2_install 'default_install'

# service['apache2'] is defined in the apache2_default_install resource but other resources are currently unable to reference it.  To work around this issue, define the following helper in your cookbook:
service 'apache2' do
  service_name lazy { apache_platform_service_name }
  supports restart: true, status: true, reload: true
  action :nothing
end

apache2_install 'default_install'
apache2_module 'deflate'
apache2_module 'headers'
apache2_module 'ssl'

app_dir = '/var/www/html'

directory app_dir do
  recursive true
  owner lazy { default_apache_user }
  group lazy { default_apache_group }
end

file "#{app_dir}/index.html" do
  content 'Hello World'
  owner   lazy { default_apache_user }
  group   lazy { default_apache_group }
end

#git "#{node[:apache][:app][:dir]}/index.html" do
#  repository node[:apache][:git_repository]
#  revision node[:apache][:git_revision]
#  action :sync
#  notifies :restart, resources(:service => "apache2")
#end
