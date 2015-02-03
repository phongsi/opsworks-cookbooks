# 9am utc is 5am eastern
node[:deploy].each do |application, deploy|
  cron_env = {"PATH" => "/usr/local/bin:$PATH"}
  cron "send_daily_report" do
    environment cron_env
    minute "0"
    hour "9"
    weekday "*"
    command "/bin/su - #{deploy[:user]} -c 'cd /srv/www/#{application}/current && RAILS_ENV=production bundle exec rails runner \"ActionAutomator.send_morning_stat_reports\"'"
  end
end

node[:deploy].each do |application, deploy|
  cron_env = {"PATH" => "/usr/local/bin:$PATH"}
  cron "send_performance_report" do
    environment cron_env
    minute "0"
    hour "10"
    weekday "*"
    command "/bin/su - #{deploy[:user]} -c 'cd /srv/www/#{application}/current && RAILS_ENV=production bundle exec rails runner \"ActionAutomator.send_daily_performance_reports\"'"
  end
end

node[:deploy].each do |application, deploy|
  cron_env = {"PATH" => "/usr/local/bin:$PATH"}
  cron "send_group_performance_report" do
    environment cron_env
    minute "0"
    hour "10"
    weekday "*"
    command "/bin/su - #{deploy[:user]} -c 'cd /srv/www/#{application}/current && RAILS_ENV=production bundle exec rails runner \"ActionAutomator.send_daily_group_performance_reports\"'"
  end
end

node[:deploy].each do |application, deploy|
  cron_env = {"PATH" => "/usr/local/bin:$PATH"}
  cron "cleanup_oauth" do
    environment cron_env
    minute "0"
    hour "9"
    weekday "*"
    command "/bin/su - #{deploy[:user]} -c 'cd /srv/www/#{application}/current && RAILS_ENV=production bundle exec rails runner \"OauthCleaner.clean_grants;OauthCleaner.clean_tokens\"'"
  end
end

node[:deploy].each do |application, deploy|
  cron_env = {"PATH" => "/usr/local/bin:$PATH"}
  cron "cleanup_stale_apts" do
    environment cron_env
    minute "0"
    hour "*"
    weekday "*"
    command "/bin/su - #{deploy[:user]} -c 'cd /srv/www/#{application}/current && RAILS_ENV=production bundle exec rails runner \"Cleaner.clean\"'"
  end
end

node[:deploy].each do |application, deploy|
  cron_env = {"PATH" => "/usr/local/bin:$PATH"}
  cron 'calculate_historical_velocities' do
    environment cron_env
    minute "0"
    hour "10"
    weekday "*"
    command "/bin/su - #{deploy[:user]} -c 'cd /srv/www/#{application}/current && RAILS_ENV=production bundle exec rails runner \"ActionAutomator.update_historical_velocities\"'"
  end
end