node[:deploy].each do |application, deploy|
  ruby_block "insert_test" do
    block do
      file = Chef::Util::FileEdit.new("#{deploy[:deploy_to]}/shared/config/application.yml")
      file.insert_line_if_no_match("/LAYER_TYPES/", "LAYER_TYPES: \"#{node[:opsworks][:instance][:layers].join(',')}\"")
      file.write_file
    end
  end
end