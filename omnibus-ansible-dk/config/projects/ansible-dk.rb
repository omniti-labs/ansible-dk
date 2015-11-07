name "ansible-dk"
maintainer "OmniTI"
homepage "https://github.com/omniti-labs/ansible-dk"

# Defaults to C:/ansibledk on Windows
# and /opt/ansibledk on all other platforms
install_dir "#{default_root}/#{name}"

build_version Omnibus::BuildVersion.semver
build_iteration 1

# Version pinning.  Most of the software definitons have a
# default_version of "master" (ie, floating on latest)
override :ruby,              version: "2.1.7"
override :bundler,           version: "1.10.6"
override :rubygems,          version: "2.4.8"
override :'test-kitchen',    version: "v1.4.2"
override :'kitchen-ansible', version: "0.0.30"
override :'kitchen-vagrant', version: "v0.19.0"


# Creates required build directories
dependency "preparation"

# ansibledk dependencies/components

# Python land
dependency "python"
dependency "pip"
dependency "ansible-dk-cli"

# Ruby land
dependency "ruby"
dependency "rubygems"
dependency "bundler"
dependency "test-kitchen"
dependency "kitchen-ansible"
dependency "kitchen-vagrant"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"

compress :dmg
