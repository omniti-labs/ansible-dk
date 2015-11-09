name "paramiko"
default_version "1.15.2"

dependency "python"
dependency "pip"
dependency "pycrypto"

build do
  command "#{install_dir}/embedded/bin/pip install -I --install-option=\"--install-scripts=#{install_dir}/embedded/bin\" #{name}==#{version}"
end
