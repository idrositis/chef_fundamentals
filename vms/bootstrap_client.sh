#!/usr/bin/env bash
# Setup the CHEF client box

. /vagrant/functions || echo "Sourcing function file failed!"

kill_respawn_ttys

fetch_and_install_chef_rpm chef "https://www.opscode.com/chef/metadata?v=latest&prerelease=false&nightlies=false&p=el&pv=6&m=x86_64"

chef_recipe_apply /vagrant/chef/recipe_chef_user.rb
chef_recipe_apply /vagrant/chef/recipe_chef_sudo_client.rb

echo_ips
