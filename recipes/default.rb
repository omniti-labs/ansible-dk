# Use the omnibus-build resource to build the project

directory node[:omnibus][:project_repo] do
  owner node[:omnibus][:build_user]
end

git node[:omnibus][:project_repo] do
  repository 'https://github.com/omniti-labs/ansible-dk.git'
  action :sync
  user node[:omnibus][:build_user]
end

link "#{node[:omnibus][:project_repo]}/.gitconfig" do
  to "/home/#{node[:omnibus][:build_user]}/.gitconfig"
end

file "#{node[:omnibus][:project_repo]}/Gemfile.lock" do
  action :delete
end

omnibus_build 'ansible-dk' do
  project_dir "#{node[:omnibus][:project_repo]}"
  config_overrides({dummy: 'value' })
end
