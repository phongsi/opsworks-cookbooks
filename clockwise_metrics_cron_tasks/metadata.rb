maintainer       "Dan DeBruler"
maintainer_email "ddebruler@gmail.com"
license          "MIT"
description      "Configure and cron to run Clockwise specific tasks"
version          "0.1"

recipe 'clockwise_metrics_cron_tasks::default', 'Sets up cron on running instances. Use on deploy.'

depends 'deploy'