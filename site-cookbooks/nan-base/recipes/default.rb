package "popularity-contest" do
  # Cron failures, not required.
  action :remove
end

# Basic Packages
%w{
  build-essential
  vim
  curl
  git-core
  sysstat
  atop
  htop
  zsh
  libssl-dev
  screen
  tmux
  fdupes
  iotop
  docker.io
  tcsh
}.each do |p|
  package p do
    action :install
  end
end

# Nope.jpg
package 'apparmor' do
  action :remove
end

# Permissive, nopasswd sudoers
cookbook_file "/etc/sudoers" do
  mode 0440
end

node[:admins].each do |username, data|
  admin_user username do
    public_key data[:public_key]
    full_name data[:name]
  end
end
