name "ansible-toolkit"
default_version "1.3.2"

dependency "python"
dependency "pip"
dependency "ansible"

build do
  command "#{install_dir}/embedded/bin/pip install -I --install-option=\"--install-scripts=#{install_dir}/embedded/bin\" #{name}==#{version}"

  # This is an Officially Exposed Tool
  [
    'atk-show-vars',
    'atk-show-template',
    'atk-vault',
    'atk-git-diff',    
  ].each do |tool|      
    link "#{install_dir}/embedded/bin/#{tool}", "#{install_dir}/bin"
  end
end
