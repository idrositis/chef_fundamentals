#!/usr/bin/env bash
# Script to setup the kitchen VM

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

# Install ChefDK 
rpm -qi chefdk &>/dev/null || {
  echo "Setting up ChefDK ..."
  #gpg --keyserver keys.gnupg.net --recv-keys 83EF826A
  gpg --keyserver keys.gnupg.net --recv-keys 83ef826a
  rpm -ihv https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chefdk-0.6.0-1.el6.x86_64.rpm
}

# Create group/user chef
sudo chef-apply /vagrant/recipe_chef_user.rb

# Enable full-sudo for chef user; needed for docker
sudo chef-apply /vagrant/recipe_chef_sudo.rb

# Echo IP
ip -4 a s en1
