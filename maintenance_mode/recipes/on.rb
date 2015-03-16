node[:deploy].each do |application, deploy|
  execute "turn_on_maintenance_mode" do
    command "cp /srv/www/#{application}/current/public/503.html /srv/www/#{application}/current/tmp/503.html"
  end
end