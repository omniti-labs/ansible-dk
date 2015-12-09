name "molecule"
default_version "1.0.6"

dependency "python"
dependency "pip"

build do
  command "#{install_dir}/embedded/bin/pip install -I --install-option=\"--install-scripts=#{install_dir}/embedded/bin\" #{name}==#{version}"

  # This is an Officially Exposed Tool
  [
    'molecule',
  ].each do |tool|
    link "#{install_dir}/embedded/bin/#{tool}", "#{install_dir}/bin"
  end
end
