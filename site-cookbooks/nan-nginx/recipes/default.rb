package 'nginx-full'

service 'nginx'

file "/etc/nginx/sites-enabled/default" do
  action :delete
end

directory "/opt/html" do
  action :create
end

git "/opt/html/nan" do
  repository "https://github.com/campjs/NaN.git"
  action :sync
end

cookbook_file "/etc/nginx/sites-enabled/nan.conf" do
  notifies :restart, "service[nginx]"
end


