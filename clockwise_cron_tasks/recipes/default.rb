# 9am utc is 5am eastern
node[:deploy].each do |application, deploy|
  cron "send_daily_report" do
    minute "*/10"
    hour "*"
    weekday "*"
    command %Q{
      cd /srv/www/#{application}/current &&
      /usr/bin/env /usr/local/bin/ruby bin/rails runner -e production "ActionAutomator.send_morning_stat_reports"
    }
  end
end