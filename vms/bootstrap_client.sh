#!/usr/bin/env bash
# Setup the CHEF client box

# Create group/user chef
which &>/dev/null chef-apply
if [ $? -ne 0 ]; then
  echo "[WARN] chef-apply not installed: chef customization skipped!"
else
  sudo chef-apply /vagrant/recipe_chef_user.rb
fi

# Echo IP(s)
for i in 0 1; do
  echo "IP/eth$i: "$(ip -4 a s eth$i|grep inet|awk '{print $2}'|cut -d'/' -f1)
done
