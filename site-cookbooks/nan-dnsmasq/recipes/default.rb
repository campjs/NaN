package "dnsmasq"

service "dnsmasq"

# TODO: Re-enable at camp, not brave enough to switch on here. Yet.
# template "/etc/dnsmasq.d/dhcp" do
# 	mode 0644
# 	owner "root"
# 	notifies :restart, "service[dnsmasq]"
# end

template "/etc/hosts" do
	mode 0644
	owner "root"
	notifies :restart, "service[dnsmasq]"
end
