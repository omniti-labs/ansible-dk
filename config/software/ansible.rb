name "ansible"
default_version "1.9.4"

dependency "python"
dependency "pip"
dependency "paramiko"
dependency "boto"

build do
  command "#{install_dir}/embedded/bin/pip install -I --install-option=\"--install-scripts=#{install_dir}/embedded/bin\" #{name}==#{version}"

  # This is an Officially Exposed Tool
  [
    'ansible',
    'ansible-playbook',
    'ansible-vault',
    'ansible-doc',
    'ansible-pull',
    'ansible-galaxy',
  ].each do |tool|      
    link "#{install_dir}/embedded/bin/#{tool}", "#{install_dir}/bin"
  end
end
