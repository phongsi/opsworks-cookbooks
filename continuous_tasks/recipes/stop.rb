include_recipe "continuous_tasks::service"

node[:deploy].each do |application, deploy|

  execute "stop Rails app #{application}" do
    command "sudo monit stop -g continuous_tasks_#{application}_group"
  end

end