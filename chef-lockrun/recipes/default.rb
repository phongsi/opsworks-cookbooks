include_recipe 'apt'
include_recipe 'build-essential'

TMP     = '/tmp'
INSTALL = '/usr/local/bin'
BIN     = 'lockrun'

cookbook_file "#{TMP}/#{BIN}.c" do
  mode 0644
end

bash "install #{BIN}" do
  cwd TMP
  code <<-CODE
    make #{BIN}
    install #{BIN} #{INSTALL}
  CODE
end
