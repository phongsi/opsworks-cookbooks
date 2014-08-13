node[:deploy].each do |application, deploy|
  cron "clean_logs" do
    minute "0"
    hour "1"
    weekday "6"
    command "find /srv/www/#{application}/shared/log -mtime +7 -type f -name \"*.log*\" | xargs rm"
  end
end