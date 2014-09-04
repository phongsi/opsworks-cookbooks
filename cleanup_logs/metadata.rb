maintainer       "Phong Si"
maintainer_email "phong.si@gmail.com"
license          "MIT"
description      "Configure and cron to cleanup old logs"
version          "0.1"

recipe 'cleanup_logs::default', 'Sets up cron on new and running instances. Use on setup and deploy.'

depends 'deploy'