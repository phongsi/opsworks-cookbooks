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