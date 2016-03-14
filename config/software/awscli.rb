name "awscli"
default_version "1.9.5"
dependency "python"
dependency "pip"
dependency "boto"

build do
  command "#{install_dir}/embedded/bin/pip install -I --install-option=\"--install-scripts=#{install_dir}/embedded/bin\" #{name}==#{version}"

  # This is an Officially Exposed Tool
  link "#{install_dir}/embedded/bin/aws", "#{install_dir}/bin"

end
