docker_image 'mipearson/swircd'

docker_container 'mipearson/swircd' do
  image 'mipearson/swircd'
  action :run
  detach true
  port "6667:6667"
end
