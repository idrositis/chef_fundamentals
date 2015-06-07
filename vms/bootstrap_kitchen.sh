#!/usr/bin/env bash
# Setup the kitchen VM

# Install latest docker instead of the RHEL one
rpm -qi docker-io &>/dev/null || {
  # docker-io is part of the EPEL repo
  rpm -qi epel-release &>/dev/null || {
    echo "Setting up EPEL repo ..."
    rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6
    rpm -ihv http://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
  }

#  yum -y update
  yum -y install docker-io
}

. /vagrant/functions || echo "Sourcing function file failed!"

kill_respawn_ttys

fetch_and_install_chef_rpm chefdk "https://www.opscode.com/chef/metadata-chefdk?v=latest&prerelease=false&nightlies=false&p=el&pv=6&m=x86_64"

chef_recipe_apply /vagrant/recipe_chef_user.rb

chef_recipe_apply /vagrant/recipe_chef_sudo.rb

echo_ips
