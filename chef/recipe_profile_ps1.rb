# Custom bash prompt

profile_file = "custom_ps1_chef.sh"

file "/etc/profile.d/#{profile_file}" do
  action :create
  content IO.read("/chef/files/#{profile_file}")
  mode "0644"
  owner "root"
  group "root"
end
