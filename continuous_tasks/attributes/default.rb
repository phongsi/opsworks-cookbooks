include_attribute "deploy"

default[:continuous_tasks] = {}

case node[:platform_family]
when 'rhel', 'fedora', 'suse'
  default[:monit][:includes_dir] = '/etc/monit.d'
else
  default[:monit][:includes_dir] = '/etc/monit/conf.d'
end

node[:deploy].each do |application, deploy|

  default[:continuous_tasks][application] = {}

  default[:continuous_tasks][application][:restart_command] = "sudo monit restart -g continuous_tasks_#{application}_group"

end