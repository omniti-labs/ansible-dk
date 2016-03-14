name "jq"
default_version "master"
relative_path "jq"
source git: "git://github.com/stedolan/jq.git"

dependency "libtool"
dependency "make"
dependency "autoconf"
dependency "automake"


build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "autoreconf -i", env: env
  command "./configure --disable-maintainer-mode --prefix=#{install_dir}/embedded", env: env
  make "-j #{workers}", env: env
  make "install", env: env

  # This is an Officially Exposed Tool
  link "#{install_dir}/embedded/bin/jq", "#{install_dir}/bin"
  
end
