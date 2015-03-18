# 5am utc is 1am eastern
node[:deploy].each do |application, deploy|
  cron "clean_logs" do
    minute "0"
    hour "5"
    weekday "*"
    command "find /srv/www/#{application}/shared/log -mtime +1 -type f -name \"*.log*\" | xargs rm"
  end

  cron "clean_nginx_logs" do
    minute "0"
    hour "5"
    weekday "*"
    command "find /var/log/nginx -mtime +1 -type f -name \"*.log*\" | xargs rm"
    only_if { ::File.directory?("/var/log/nginx") }
  end

  cron "clean_logstash_logs" do
    minute "0"
    hour "5"
    weekday "*"
    command "find /var/log/logstash -mtime +1 -type f -name \"*.log*\" | xargs rm"
    only_if { ::File.directory?("/var/log/logstash") }
  end
end