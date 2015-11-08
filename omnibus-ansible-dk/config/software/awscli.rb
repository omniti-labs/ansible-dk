name "awscli"
default_version "1.9.5"
dependency "python"
dependency "pip"
dependency "boto"

build do
  # ship_license "https://raw.githubusercontent.com/aws/aws-cli/develop/LICENSE.txt"
  command "#{install_dir}/embedded/bin/pip install -I --install-option=\"--install-scripts=#{install_dir}/bin\" #{name}==#{version}"
end
