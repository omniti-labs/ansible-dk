# Use the omnibus-build resource to build the project

directory '/var/cache/omnibus-project' do
  owner node[:omnibus][:build_user]
end

git '/var/cache/omnibus-project' do
  repository 'https://github.com/omniti-labs/ansible-dk.git'
  action :sync
  user node[:omnibus][:build_user]
end

link '/var/cache/omnibus-project/omnibus-ansible-dk/.gitconfig' do
  to "/home/#{node[:omnibus][:build_user]}/.gitconfig"
end

file '/var/cache/omnibus-project/omnibus-ansible-dk/Gemfile.lock' do
  action :delete
end

omnibus_build 'ansible-dk' do
  project_dir '/var/cache/omnibus-project/omnibus-ansible-dk'
  config_overrides({dummy: 'value' })
end
