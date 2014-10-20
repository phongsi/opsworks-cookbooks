# 9am utc is 5am eastern
node[:deploy].each do |application, deploy|
  cron_env = {"PATH" => "/usr/local/bin:$PATH"}
  cron "cleanup_stale_appointments" do
    environment cron_env
    minute "0"
    hour "*"
    weekday "*"
    command "/bin/su - #{deploy[:user]} -c 'cd /srv/www/#{application}/current && RAILS_ENV=production bundle exec rails runner \"Appointment.cleanup\"'"
  end
end