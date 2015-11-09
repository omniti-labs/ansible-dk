name "serverspec"
default_version "master"
relative_path "serverspec"

source git: "git@github.com:mizzy/serverspec.git"

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

  gem "build serverspec.gemspec", env: env
  gem "install serverspec-*.gem" \
      " --no-ri --no-rdoc", env: env
end
