package 'samba'

service 'nmbd' do
  provider Chef::Provider::Service::Upstart
end

service 'smbd' do
  provider Chef::Provider::Service::Upstart
end

directory "/opt/shared" do
  action :create
  mode 0755
  user 'nobody'

end

directory "/opt/dropbox" do
  action :create
  mode 0755
  user 'nobody'
end

file "/opt/shared/README" do
  content "This is read-only content provided by CampJS."
  action :create
  mode 0644
end

file "/opt/dropbox/README" do
  content "This is a read-write shared that you can put files in for other people to access."
  mode 0644
end

cookbook_file "/etc/samba/smb.conf" do
  notifies :restart, 'service[smbd]'
  notifies :restart, 'service[nmbd]'
end
