name "setuptools"
default_version "18.5"

dependency "python"

source :url => "https://pypi.python.org/packages/source/s/setuptools/setuptools-#{version}.tar.gz",
       :md5 => '533c868f01169a3085177dffe5e768bb'

relative_path "setuptools-#{version}"

build do
  command "#{install_dir}/embedded/bin/python setup.py install --prefix=#{install_dir}/embedded"
end
