if node[:opsworks][:instance][:layers].include?('rails-app') || node[:opsworks][:instance][:layers].include?('delayed-job-workers') || node[:opsworks][:instance][:layers].include?('scheduled-jobs')
  puts 'testing----------'
  include_recipe "opsworks_custom_env::restart_command"
  include_recipe "opsworks_custom_env::write_config"

end
