name "bats"
default_version "v0.4.0"

relative_path "bats"
source git: "git://github.com/sstephenson/bats.git"


build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "./install.sh #{install_dir}", env: env
  
  # This is an Officially Exposed Tool
  [
    'bats',
  ].each do |tool|      
    link "#{install_dir}/embedded/bin/#{tool}", "#{install_dir}/bin"
  end
end
