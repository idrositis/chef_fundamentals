# Custom bash prompt
#
file "/etc/profile.d/custom_ps1_chef.sh" do
  action :create
  content "# Preferable prompt for chef\nexport PS1='\u@\h:\w$ '\n"
  mode "0644"
  owner "root"
  group "root"
end
