name "kitchen-ansible"
default_version "master"
relative_path "kitchen-ansible"

source git: "git://github.com/neillturner/kitchen-ansible.git"

if windows?
  dependency "ruby-windows"
  dependency "ruby-windows-devkit"
else
  dependency "ruby"
end

dependency "rubygems"
dependency "bundler"
dependency "test-kitchen"


build do
  env = with_standard_compiler_flags(with_embedded_path)

  bundle "install", env: env

  gem "build kitchen-ansible.gemspec", env: env
  gem "install kitchen-ansible-*.gem" \
      " --no-ri --no-rdoc", env: env
end
