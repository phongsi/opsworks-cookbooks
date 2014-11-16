# 9am utc is 5am eastern
node[:deploy].each do |application, deploy|
  cron_env = {"PATH" => "/usr/local/bin:$PATH"}
  cron "check_wait_rooms" do
    environment cron_env
    minute "*/2"
    hour "*"
    weekday "*"
    command "/bin/su - #{deploy[:user]} -c 'cd /srv/www/#{application}/current && RAILS_ENV=production bundle exec rails runner \"ActionAutomator.check_wait_rooms\"'"
  end
  cron "check_ontime_status" do
    environment cron_env
    minute "*/2"
    hour "*"
    weekday "*"
    command "/bin/su - #{deploy[:user]} -c 'cd /srv/www/#{application}/current && RAILS_ENV=production bundle exec rails runner \"ActionAutomator.check_ontime_status\"'"
  end
  cron "discharge_old_patients" do
    environment cron_env
    minute "0"
    hour "9"
    weekday "*"
    command "/bin/su - #{deploy[:user]} -c 'cd /srv/www/#{application}/current && RAILS_ENV=production bundle exec rails runner \"ActionAutomator.discharge_appointments\"'"
  end
  cron "fill_missing_timestamps" do
    environment cron_env
    minute "0"
    hour "9"
    weekday "*"
    command "/bin/su - #{deploy[:user]} -c 'cd /srv/www/#{application}/current && RAILS_ENV=production bundle exec rails runner \"ActionAutomator.request_timestamps\"'"
  end
end