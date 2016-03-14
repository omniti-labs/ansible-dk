# From https://github.com/DataDog/omnibus-software - apparent Apache 2.0 license

name "boto"
default_version "2.36.0"
dependency "python"
dependency "pip"

build do
  command "#{install_dir}/embedded/bin/pip install -I --install-option=\"--install-scripts=#{install_dir}/embedded/bin\" #{name}==#{version}"
end
