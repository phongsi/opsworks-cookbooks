if node[:opsworks][:instance][:layers].include?('rails-app')

  include_recipe "opsworks_custom_env::restart_command"
  include_recipe "opsworks_custom_env::write_config"

elsif node[:opsworks][:instance][:layers].include?('delayed-job-workers')

  include_recipe "opsworks_custom_env::write_config"

end
