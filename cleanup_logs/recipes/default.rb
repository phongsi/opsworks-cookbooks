node[:deploy].each do |application, deploy|
  cron "clean_logs" do
    minute "*"
    # hour "1"
    weekday "*"
    command "find /srv/www/#{application}/shared/log -mtime +7 -type f -name \"*.log*\" | xargs rm"
  end
end