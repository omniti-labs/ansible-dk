name "kitchen-ec2"
default_version "master"
relative_path "kitchen-ec2"

source git: "git@github.com:test-kitchen/kitchen-ec2.git"

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

  bundle "install --without test", env: env

  gem "build kitchen-ec2.gemspec", env: env
  gem "install kitchen-ec2-*.gem" \
      " --no-ri --no-rdoc", env: env
end
