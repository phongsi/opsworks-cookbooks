include_recipe "continuous_tasks::service"

# setup delayed_job service per app
node[:deploy].each do |application, deploy|

  if deploy[:application_type] != 'rails'
    Chef::Log.debug("Skipping continuous_tasks::setup application #{application} as it is not a Rails app")
    next
  end

  opsworks_deploy_user do
    deploy_data deploy
  end

  opsworks_deploy_dir do
    user deploy[:user]
    group deploy[:group]
    path deploy[:deploy_to]
  end

  # Allow deploy user to restart tasks
  template "/etc/sudoers.d/#{deploy[:user]}" do
    mode 0440
    source "sudoer.erb"
    variables :user => deploy[:user]
  end

  template "#{node[:monit][:includes_dir]}/continuous_tasks_#{application}.monitrc" do
    mode 0644
    source "continuous_tasks_monitrc.erb"
    variables(:deploy => deploy, :application => application)
    
    notifies :reload, resources(:service => "monit"), :immediately
  end

end