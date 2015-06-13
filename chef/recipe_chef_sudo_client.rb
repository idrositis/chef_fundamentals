# chef-apply sudo for chef user

# sudo package needs to be installed
package "sudo" do
  action :install
end

# chef-apply sudo for chef user; needed for examples on nodeX
file "/etc/sudoers.d/chef" do
  action :create
  content "# Allow chef user to run chef-apply\nchef ALL=(ALL) NOPASSWD:/usr/bin/chef-apply\n"
  mode "0400"
  owner "root"
  group "root"
end
