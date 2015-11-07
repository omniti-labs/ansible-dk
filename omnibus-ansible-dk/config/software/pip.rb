name "pip"
default_version "7.1.2"

dependency "setuptools"

source :url => "https://pypi.python.org/packages/source/p/pip/pip-#{version}.tar.gz",
       :md5 => '3823d2343d9f3aaab21cf9c917710196'

relative_path "pip-#{version}"

build do
  command "#{install_dir}/embedded/bin/python setup.py install --prefix=#{install_dir}/embedded"
end
