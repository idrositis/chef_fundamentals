# CHEF Fundamentals | Example#1
# Custom /etc/motd
#
file "/etc/motd" do
  action :create
  # Doesn't touch the file if exists
  #action :create_if_missing

  content "- Greetings stranger!\n"
  # Read content from a file
  #content IO.read("/chef/files/motd_devbox")

  mode "0644"
  owner "root"
  group "root"

  # Avoid backup
  #backup false
end
