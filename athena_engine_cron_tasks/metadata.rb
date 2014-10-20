maintainer       "Phong Si"
maintainer_email "phong.si@gmail.com"
license          "MIT"
description      "Configure and cron to run Athena Engine specific tasks"
version          "0.1"

recipe 'athena_engine_cron_tasks::default', 'Sets up cron on running instances. Use on deploy.'

depends 'deploy'