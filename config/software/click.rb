name "click"
default_version "5.1"
dependency "python"
dependency "pip"

build do
  command "#{install_dir}/embedded/bin/pip install -I --install-option=\"--install-scripts=#{install_dir}/embedded/bin\" #{name}==#{version}"
end
