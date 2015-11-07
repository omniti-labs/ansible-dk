name "ansible-dk"
description "One day this might be a generic CLI tool; today it is a hack to make shell-init work"

build do
  copy Dir.pwd + "/../ansible-dk-cli/ansible-dk", "#{install_dir}/embedded/bin"
  copy Dir.pwd + "/../ansible-dk-cli/ansible-dk", "#{install_dir}/bin"  
end 
