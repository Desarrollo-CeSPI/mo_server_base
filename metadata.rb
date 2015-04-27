name             'mo_server_base'
maintainer       'Christian A. Rodriguez & Leandro Di Tommaso'
maintainer_email 'chrodriguez@gmail.com leandro.ditommaso@mikroways.net'
license          'MIT'
description      'Installs/Configures mo_server_base'
long_description 'Installs/Configures mo_server_base'
version          '1.0.2'

depends 'apt',              '~>2.7.0'
depends 'ntp',              '~>1.6.4'
depends 'nrpe',             '~> 1.5.0'
depends 'rsyslog',          '~>1.15.0'
depends 'sudo',             '~>2.7.1'
depends 'ubuntu',           '~>1.0.4'
depends 'users',            '~>1.7.0' 
depends 'chef-sugar',       '~> 2.5.0'
depends 'hostname',         '~> 0.3.0'
depends 'postfix',          '~> 3.6.2'
depends 'resolver',         '~> 1.2.0'
depends 'logwatch',         '~> 1.1.0'
depends 'locale',           '~> 1.0.0'
depends 'locales',          '~> 0.3.0'
