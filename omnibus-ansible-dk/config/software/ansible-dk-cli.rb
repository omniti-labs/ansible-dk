name "ansible-dk-cli"
default_version "0.1.0" # This is just to silence a warning
description "One day this might be a generic CLI tool; today it is a hack to make shell-init work"

build do
  copy Dir.pwd + "/../ansible-dk-cli/ansible-dk", "#{install_dir}/embedded/bin"
  copy Dir.pwd + "/../ansible-dk-cli/ansible-dk", "#{install_dir}/bin"  
end 
