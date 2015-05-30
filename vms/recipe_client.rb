# Recipe for CHEF client/text-box

# chef group
group "chef" do
  action :create
  gid "2000"
  non_unique false
end

# chef user
user "chef" do
  action :create
  comment "chef user"
  gid "chef"
  password "$6$D3vvqQxe$tlPkWVN9Uug7.GRAvq0VEXDiyhKMb5NPmfSjgVfxwnjxCBDJwOJhykfr7DuM/Yi6yGbnrnwWmeiT2eXa0E2Mt/"
  shell "/bin/bash"
  uid "2001"
end

# sudo package is needed
package "sudo" do
  action :install
end

# Ensure sudo for chef group
# NOTE: that is for our tests only and should be avoided elsewhere
file "/etc/sudoers.d/chef" do
  action :create
  content "%chef ALL=(ALL) NOPASSWD:ALL"
  mode "00400"
  owner "root"
  group "root"
end
