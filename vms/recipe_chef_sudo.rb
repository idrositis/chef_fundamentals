# Enable full-sudo for chef user; needed for docker/kitchen

# sudo package needs to be installed
package "sudo" do
  action :install
end

# Enable full-sudo for chef user; needed for docker/kitchen
# NOTE: for our test-env only; should be avoided elsewhere!
file "/etc/sudoers.d/chef" do
  action :create
  content "# Enable full-sudo for chef user; needed for docker\nchef ALL=(ALL) NOPASSWD:ALL"
  mode "00400"
  owner "root"
  group "root"
end
