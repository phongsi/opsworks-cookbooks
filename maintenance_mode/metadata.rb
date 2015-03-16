maintainer       "Phong Si"
maintainer_email "phong.si@gmail.com"
license          "MIT"
description      "Enable maintenance mode redirect"
version          "0.1"

recipe 'maintenance_mode::on', 'Turns on maintenance mode.'
recipe 'maintenance_mode::off', 'Turns off maintenance mode.'

depends 'deploy'