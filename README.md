# CHEF Fundamentals
Stuff related to the [CHEF Funadamentals Training](https://www.chef.io/training/#fundamentals) Course.

## Contents
- `notes_raw.txt`: some raw notes from the training.
- `vms/`: a set of Vagrant VMs that can run the course.
    - **kitchen**: workstation VM with [ChefDK](https://downloads.chef.io/chef-dk)
      that manages the chef-code.

## References
- [CHEF Funadamentals](https://www.chef.io/training/#fundamentals)

## TODOs
0) Add chef-client to node1.

1) Add training examples.

2) Import custom folder per VM (for own recipies/customization files, etc.).

3) Avoid hard-coding ChefDK rpm URL; use an equivalent of the following instead:

```
$ curl 'https://www.opscode.com/chef/metadata?v=12&prerelease=false&nightlies=false&p=el&pv=6&m=x86_64'
url    https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chef-12.3.0-1.el6.x86_64.rpm
md5    c19fefcb3d033107e9fbdb3839312584
sha256 4b7c846a9ad93564cc203a5ac99890431f7d6ad159c424aa89827fd772c9881d
```

4) Import chef RPM/gpg-keys (https://tickets.opscode.com/browse/CHEF-2803).

5) Possibly use Ubuntu for the kitchen/workstation VM.
