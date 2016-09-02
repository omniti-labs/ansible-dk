# Use the omnibus-build resource to build the project

directory node[:omnibus][:project_repo] do
  owner node[:omnibus][:build_user]
end

git node[:omnibus][:project_repo] do
  repository 'https://github.com/omniti-labs/ansible-dk.git'
  branch 'centos'
  action :sync
  user node[:omnibus][:build_user]
end

link "#{node[:omnibus][:project_repo]}/.gitconfig" do
  owner node[:omnibus][:build_user]
  to "/home/#{node[:omnibus][:build_user]}/.gitconfig"
end

file "#{node[:omnibus][:project_repo]}/Gemfile.lock" do
  owner node[:omnibus][:build_user]
  action :delete
end

directory '/local' do
  owner node[:omnibus][:build_user]
  action :create
end

link "#{node[:omnibus][:project_repo]}/local" do
  owner node[:omnibus][:build_user]
  to '/local'
end

directory '/local/vendor' do
  owner node[:omnibus][:build_user]
  action :create
end

link "#{node[:omnibus][:project_repo]}/vendor" do
  owner node[:omnibus][:build_user]
  to '/local/vendor'
end

if node['platform_family'] == 'rhel'
  include_recipe 'yum-epel'
  package 'gecode-devel'
  execute '/opt/chef/embedded/bin/bundle install --path vendor/bundle' do
    user node[:omnibus][:build_user]
    cwd node[:omnibus][:project_repo]
    environment ({'USE_SYSTEM_GECODE' => '1'})
  end
end

omnibus_build 'ansible-dk' do
  project_dir "#{node[:omnibus][:project_repo]}"
  config_overrides({dummy: 'value' })
end
