node[:deploy].each do |application, deploy|
  execute "turn_off_maintenance_mode" do
    command "rm /srv/www/#{application}/current/tmp/503.html"
  end
end