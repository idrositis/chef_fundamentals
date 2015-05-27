#!/usr/bin/env bash
# Setup the CHEF client box

# Install latest docker
rpm -qi docker-io &>/dev/null || {
  # docker-io is part of the EPEL repo
  rpm -qi epel-release &>/dev/null || {
    echo "Setting up EPEL repo ..."
    rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6
    rpm -ihv http://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
  }

  yum -y update
  yum -y install docker-io
}

# Install ChefDK 
rpm -qi chefdk &>/dev/null || {
  echo "Setting up ChefDK ..."
  rpm -ihv https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chefdk-0.6.0-1.el6.x86_64.rpm
}

sudo chef-apply /vagrant/recipe_client.rb
