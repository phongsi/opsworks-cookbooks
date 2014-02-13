name             'lockrun'
maintainer       'Justin Force'
maintainer_email 'justin.force@gmail.com'
license          'MIT'
description      'Installs/Configures lockrun'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          IO.read(File.join(File.dirname(__FILE__), 'VERSION')) rescue '0.1.0'

depends 'apt'
depends 'build-essential'
