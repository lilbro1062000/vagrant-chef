package "nginx"  do
  action :install
end

service "nginx"  do
  supports :status => true, :restart => true, :reload => true
  action :nothing
end

template "/etc/nginx/common.conf" do
  source "common.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[nginx]", :immediately
end

template "/etc/nginx/fastcgi_params" do
  source "fastcgi_params.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[nginx]", :immediately
end

template "/etc/nginx/php.conf" do
  source "php.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[nginx]", :immediately
end

template "/etc/nginx/cakephp.conf" do
  source "cakephp.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[nginx]", :immediately
end

template "/etc/nginx/nginx.conf" do
  source "nginx.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[nginx]", :immediately
end

template "/etc/nginx/sites-available/default" do
  source "default.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[nginx]", :immediately
end

template "/etc/nginx/sites-available/cakephp.example" do
  source "cakephp.example.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[nginx]", :immediately
end
