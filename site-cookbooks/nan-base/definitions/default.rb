define :admin_user, shell: '/bin/bash' do
  name = params[:name]
  home_dir = "/home/#{name}"

  user name do
    comment params[:full_name]
    supports :manage_home => true
    shell params[:shell]
    home home_dir
  end

  group 'adm' do
    action :manage
    append true
    members name
    system true
  end

  directory "#{home_dir}/.ssh" do
    owner name
    group name
    mode 0755
  end

  file "#{home_dir}/.ssh/authorized_keys" do
    content params[:public_key]
    owner name
    group name
  end
end
