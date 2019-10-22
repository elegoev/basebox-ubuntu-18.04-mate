## ubuntu-18.04-mate 
Vagrant Box with Ubuntu 18.04 Mate

### Base image
Used base image [chenhan/ubuntu-mate-desktop-18.04](https://app.vagrantup.com/chenhan/boxes/ubuntu-mate-desktop-18.04)

### Automatic provisioning
The base image is provisioned with bash script [ubuntu-18.04-mate.sh](https://github.com/elegoev/basebox-ubuntu-18.04-mate/blob/master/provisioning/ubuntu-18.04-mate.sh)

### References
- [Used Vagrantfile for Basebox](https://github.com/elegoev/vagrant-ubuntu-18.04/blob/master/jenkins/vagrant/esxi/_Vagrantfile)

### Host Access
| Application    | Command         | User / Password    |
|----------------|-----------------|--------------------|
| Mate           | vagrant rdp     | vagrant / vagrant  |

###  Create Vagrant Box Environment
#### Provider "virtualbox"
1. Create directory `mkdir "name of directory"`
1. Goto directory `cd "name of directory"`
1. Create Vagrantfile `vagrant init "elegoev/ubuntu-18.04-mate"`
1. Start vagrant box `vagrant up`

#### Provider "vmware_esxi"
1. Create directory `mkdir "name of directory"`
1. Goto directory `cd "name of directory"`
1. Download basebox `vagrant box add "elegoev/ubuntu-18.04-mate" --provider vmware_esxi`
1. Create Vagrantfile `vagrant init "elegoev/ubuntu-18.04-mate"`
1. Create file [`metadata.json`](https://github.com/elegoev/vagrant-ubuntu-18.04/blob/master/jenkins/vagrant/metadata.json.tpl)
1. Copy and edit [`box.json`](https://github.com/elegoev/vagrant-ubuntu-18.04/blob/master/jenkins/vagrant/box.json.tpl)
1. Start vagrant box `vagrant up --provider vmware_esxi`

### Versioning
Repository follows sematic versioning  [![](https://img.shields.io/badge/semver-2.0.0-green.svg)](http://semver.org)

### Changelog
For all notable changes see [CHANGELOG](https://github.com/elegoev/basebox-ubuntu-18.04-mate/blob/master/CHANGELOG.md)

### License
Licensed under The MIT License (MIT) - for the full copyright and license information, please view the [LICENSE](https://github.com/elegoev/basebox-ubuntu-18.04-mate/blob/master/LICENSE) file.

### Issue Reporting
Any and all feedback is welcome.  Please let me know of any issues you may find in the bug tracker on github. You can find it [here. ](https://github.com/elegoev/basebox-ubuntu-18.04-mate/issues)
