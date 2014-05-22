directory "/opt/gitlab" do
  action :create
end

bash "gitlab_db" do
  code <<-EOH
    mysqladmin create gitlab;
    echo "CREATE USER 'gitlab'@'localhost' IDENTIFIED BY 'gitlab';" | mysql
    echo "GRANT SELECT, LOCK TABLES, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER ON `gitlabhq_production`.* TO 'gitlab'@'localhost';" | mysql
    touch gitlab_db
  EOH
  user "root"
  cwd "/tmp"
  not_if { File.exists? "/tmp/gitlab_db" }
end

docker_image 'sameersbn/gitlab'



# docker_container 'sameersbn/gitlab' do
#   image 'mipearson/swircd'
#   detach true
#   port ":6667"
#   tty true
#   volume "/opt/gitlab/data:/home/git/data"
#   env ["DB_HOST=10.0.0.1", "DB_NAME=gitlab", "DB_USER=gitlab", "DB_PASS=gitlab"]
# end
