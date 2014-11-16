# 5am utc is 1am eastern
node[:deploy].each do |application, deploy|
  cron "clean_logs" do
    minute "0"
    hour "5"
    weekday "*"
    command "find /srv/www/#{application}/shared/log -mtime +1 -type f -name \"*.log*\" | xargs rm"
  end
end