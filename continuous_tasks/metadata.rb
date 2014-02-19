maintainer       "Phong Si"
maintainer_email "phong.si@gmail.com"
license          "MIT"
description      "Configure and deploy custom daemon"
version          "0.1"

recipe 'continuous_tasks::setup', 'Set up custom daemon.'
recipe 'continuous_tasks::configure', 'Configure custom daemon.'
recipe 'continuous_tasks::deploy', 'Deploy custom daemon.'
recipe 'continuous_tasks::undeploy', 'Undeploy custom daemon.'
recipe 'continuous_tasks::stop', 'Stop custom daemon.'

depends 'deploy'