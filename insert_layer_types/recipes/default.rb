ruby_block "insert_test" do
  block do
    file = Chef::Util::FileEdit.new("#{params[:deploy][:deploy_to]}/shared/config/application.yml")
    file.insert_line_if_no_match("/layer-types/", "layer-types: #{node[:opsworks][:instance][:layers].join(', ')}")
    file.write_file
  end
end