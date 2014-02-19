include_recipe 'deploy'

node[:deploy].each do |application, deploy|

  if deploy[:application_type] != 'rails'
    Chef::Log.debug("Skipping continuous_tasks::deploy application #{application} as it is not an Rails app")
    next
  end

  opsworks_deploy_dir do
    user deploy[:user]
    group deploy[:group]
    path deploy[:deploy_to]
  end

  include_recipe "continuous_tasks::setup"

  node.set[:opsworks][:rails_stack][:restart_command] = node[:delayed_job][application][:restart_command]

  opsworks_deploy do
    deploy_data deploy
    app application
  end
end