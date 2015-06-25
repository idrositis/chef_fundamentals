# CHEF Fundamentals
Stuff related to the [CHEF Funadamentals Training](https://www.chef.io/training/#fundamentals) Course.

This repository will help you play around with [CHEF](https://www.chef.io/chef/).
You will be able to spin-up a bunch of VMs, using [vagrant](https://www.vagrantup.com).
All needed tools plus the example recipes will be available in the VMs.


## Contents
- `notes_raw.txt`: some raw notes from [CHEF Funadamentals Training](https://www.chef.io/training/#fundamentals) training.
- `chef/`: [CHEF](https://www.chef.io/chef/) recipies and examples. This directory will be mounted under `/chef` on all VMs.
- `vms/`: a set of Vagrant VMs that can run the course.
    - **devbox**: workstation VM with [ChefDK](https://downloads.chef.io/chef-dk)
      that manages the chef-code.
    - **node1**: VM with client tools installed (i.e. `chef-apply`)


## Examples

### Example #1 - Local Configuration Management

Objective: customise `/etc/motd` file on a linux node.

Prerequisites:
- `chef-apply` installed on the node
- `sudo chef-apply` privilege granted for the user
- chef-recipe locally available 

Tools: [`chef-apply`](https://docs.chef.io/ctl_chef_apply.html)

I want to try [example #1 ...](chef/example1)



## References
- [CHEF Funadamentals](https://www.chef.io/training/#fundamentals)
- [`chef-apply`](https://docs.chef.io/ctl_chef_apply.html)
- [Omnitruck API](https://docs.chef.io/api_omnitruck.html)

## TODOs
0) Enable debug mode in `vagrant up` for VMs.

1) Add more training examples.

2) Import custom folder per VM (for own recipies/customization files, etc.).

3) Avoid hard-coding Chef-Server rpm URL; use an equivalent of the following instead:

```
$ curl 'https://www.opscode.com/chef/metadata?v=12&prerelease=false&nightlies=false&p=el&pv=6&m=x86_64'
url    https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chef-12.3.0-1.el6.x86_64.rpm
md5    c19fefcb3d033107e9fbdb3839312584
sha256 4b7c846a9ad93564cc203a5ac99890431f7d6ad159c424aa89827fd772c9881d
```

4) Possibly use Ubuntu for the devbox/workstation VM.
