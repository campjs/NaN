package "squid"

service "squid3" do
  provider Chef::Provider::Service::Upstart
  action :enable
end

template "/etc/squid3/squid.conf" do
	mode 0644
	owner "root"
	notifies :restart, "service[squid3]"
end
