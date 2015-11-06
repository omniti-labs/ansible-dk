name "ansibledk"
maintainer "OmniTI"
homepage "https://github.com/omniti-labs/ansible-dk"

# Defaults to C:/ansibledk on Windows
# and /opt/ansibledk on all other platforms
install_dir "#{default_root}/#{name}"

build_version Omnibus::BuildVersion.semver
build_iteration 1

# Creates required build directories
dependency "preparation"

# ansibledk dependencies/components
dependency "python"
dependency "ruby"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"
