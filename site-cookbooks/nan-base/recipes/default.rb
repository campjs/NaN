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
  nodejs
  npm
  mysql-server
  postgresql
  redis-server
}.each do |p|
  package p do
    action :install
  end
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

link "/usr/bin/node" do
  to "/usr/bin/nodejs"
end

link "/usr/bin/docker" do
  to "/usr/bin/docker.io"
end

# WEBSCALE
apt_repository "10gen" do
  uri "http://downloads-distro.mongodb.org/repo/ubuntu-upstart"
  distribution "dist"
  components ["10gen"]
  keyserver "keyserver.ubuntu.com"
  key "C0A52C50"
end

package "mongodb-org"

