# These options are required for all software definitions
name "ansible"
default_version "1.9.4"

# A software can specify more than one version that is available for install
version("1.9.4") { source md5: "ecab080bd92b09caf5295b9f5d83da39" }

# Sources may be URLs, git locations, or path locations
source url: "https://github.com/ansible/ansible/archive/v#{version}-1.tar.gz"

# This is the path, inside the tarball, where the source resides
relative_path "ansible-#{version}-1"

build do
  # Setup a default environment from Omnibus - you should use this Omnibus
  # helper everywhere. It will become the default in the future.
  env = with_standard_compiler_flags(with_embedded_path)

  # Manipulate any configure flags you wish:
  #   For some reason zlib needs this flag on solaris
  env["CFLAGS"] << " -DNO_VIZ" if solaris?

  # "command" is part of the build DSL. There are a number of handy options
  # available, such as "copy", "sync", "ruby", etc. For a complete list, please
  # consult the Omnibus gem documentation.
  #
  # "install_dir" is exposed and refers to the top-level projects +install_dir+
  command "./configure" \
          " --prefix=#{install_dir}/embedded", env: env

  # You can have multiple steps - they are executed in the order in which they
  # are read.
  #
  # "workers" is a DSL method that returns the most suitable number of
  # builders for the currently running system.
  command "make -j #{workers}", env: env
  command "make -j #{workers} install", env: env
end
