name "pip"
default_version "7.1.2"

dependency "setuptools"

version('7.1.2') { source md5: '3823d2343d9f3aaab21cf9c917710196' }
version('8.0.3') { source md5: '8f000fc101e47f4f199fa29df1e0b0df' }

source :url => "https://pypi.python.org/packages/source/p/pip/pip-#{version}.tar.gz"

relative_path "pip-#{version}"

build do
  command "#{install_dir}/embedded/bin/python setup.py install --prefix=#{install_dir}/embedded"
end
