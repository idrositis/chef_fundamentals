## Example #1 - Local Configuration Management

Objective: customise `/etc/motd` file on a linux node.

Prerequisites:
- `chef-apply` installed on the node
- `sudo chef-apply` privilege granted for the user
- chef-recipe locally available

Tools: [`chef-apply`](https://docs.chef.io/ctl_chef_apply.html)

Run the example:
  1. Spin-up *devbox* VM (from `vms/` directory): `vagrant up devbox`
  2. SSH to test box: `vagrant ssh devbox`
  3. Use `chef` user: `sudo su - chef`
  4. Check local motd: `ls -l /etc/motd`
  5. Update motd using the recipe: `sudo chef-apply /chef/example1/custom_motd.rb`
  6. Verify update: `ls -l /etc/motd`; logout and login on the VM will make the updated motd to show up.
  7. Check backup file (created by `chef-apply`): `find /var/chef/backup -iname 'motd*'`


## Beyond:

Change/play-around the recipe file and apply again.


## References

- [`chef-apply`](https://docs.chef.io/ctl_chef_apply.html)
