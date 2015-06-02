#!/usr/bin/env bash
# Setup the CHEF client box

# Force a refresh of the login-screen
pkill -15 mingetty

# Install chef-client; just the RPM, no service
rpm -qi chef &>/dev/null || {
  echo -e "Importing CHEF RPM key... \c" && rpm --quiet --import https://downloads.getchef.com/chef.gpg.key || echo "Failed!"
  chef_el6_x64=$(curl -q 2>/dev/null 'https://www.opscode.com/chef/metadata?v=12&prerelease=false&nightlies=false&p=el&pv=6&m=x86_64')
  if [ $? -eq 0 ]; then
    chef_rpm_url=$(echo $chef_el6_x64|awk '{print $2}')
    chef_rpm_md5=$(echo $chef_el6_x64|awk '{print $4}')
    echo "Downloading ${chef_rpm_url##*/}... " && wget -q -O - "$chef_rpm_url" > /tmp/chef.rpm || echo "Failed!-("
    echo "Verifying checksum... " && md5sum /tmp/chef.rpm | grep -qw $chef_rpm_md5 || echo "Failed!-("
    echo "Installing ${chef_rpm_url##*/}... " && yum -y --quiet localinstall /tmp/chef.rpm || echo "Failed!-("
  fi
}

# Create group/user chef
which &>/dev/null chef-apply
if [ $? -ne 0 ]; then
  echo "[WARN] chef-apply not installed: chef customization skipped!"
else
  chef-apply /vagrant/recipe_chef_user.rb
fi

# Echo IP(s)
for i in 0 1; do
  echo "IP/eth$i: "$(ip -4 a s eth$i | grep inet | awk '{print $2}' | cut -d'/' -f1)
done
