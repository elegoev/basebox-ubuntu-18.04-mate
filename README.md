# ubuntu-18.04-mate

Vagrant Box with Ubuntu 18.04 and mate

## Base image

Used base image [elegoev/ubuntu-18.04](https://app.vagrantup.com/elegoev/boxes/ubuntu-18.04)

## Directory Description

| directory | description                                          |
|-----------|------------------------------------------------------|
| inspec    | inspec test profiles with controls                   |
| packer    | packer build, provisioner and post-processor scripts |
| test      | test environment for provision & inspec development  |

## Configuration

### Vagrant Cloud

- [elegoev/ubuntu-18.04-mate](https://app.vagrantup.com/elegoev/boxes/ubuntu-18.04-mate)

### Useful Vagrant Plugins

- [vagrant-disksize](https://github.com/sprotheroe/vagrant-disksize)
- [vagrant-hosts](https://github.com/oscar-stack/vagrant-hosts)
- [vagrant-secret](https://github.com/tcnksm/vagrant-secret)
- [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest)
- [vagrant-serverspec](https://github.com/vvchik/vagrant-serverspec)
- [vagrant-vmware-esxi](https://github.com/josenk/vagrant-vmware-esxi)

### Vagrantfile

    Vagrant.configure("2") do |config|

      $basebox_name="ubuntu-18.04-mate-test"
      $basebox_hostname="ubuntu-1804-mate-test"
      $src_image_name="elegoev/ubuntu-18.04-mate"
      $vb_group_name="basebox-mate-test"

      config.vm.define "#{$basebox_name}" do |machine|
        machine.vm.box = "#{$src_image_name}"
    
        # define guest hostname
        machine.vm.hostname = "#{$basebox_hostname}"

        machine.vm.provider "virtualbox" do |vb|
          vb.name = $basebox_name
          vb.cpus = 1
          vb.customize ["modifyvm", :id, "--memory", "1024" ]
          vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
          vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
          vb.customize ["modifyvm", :id, "--groups", "/#{$vb_group_name}" ]
          vb.customize ["modifyvm", :id, "--vram", 256 ]
        end

        # forwarding ports
        machine.vm.network "forwarded_port", id: "rdp",  auto_correct: true, protocol: "tcp", guest: 3389, host: 33333, host_ip: "127.0.0.1"

      end   

    end


### Using mate

#### xRDP Issue

    xRDP is not working correctly, after 'vagrant up' try the following

    1. 'vagrant rdp' & login with ubuntu / ubuntu (black screen)
    2. Disconnect RDP Client
    3. 'vagarnt rdp' & login with vagrant / vagrant

### Reference

- [How to set up an xRDP server on Ubuntu 18.04](https://medium.com/@vivekteega/how-to-setup-an-xrdp-server-on-ubuntu-18-04-89f7e205bd4e)

### Versioning

Repository follows sematic versioning  [![semantic versioning](https://img.shields.io/badge/semver-2.0.0-green.svg)](http://semver.org)

### Changelog

For all notable changes see [CHANGELOG](https://github.com/elegoev/basebox-ubuntu-18.04-mate/blob/master/CHANGELOG.md)

### License

Licensed under The MIT License (MIT) - for the full copyright and license information, please view the [LICENSE](https://github.com/elegoev/basebox-ubuntu-18.04-mate/blob/master/LICENSE) file.

### Issue Reporting

Any and all feedback is welcome.  Please let me know of any issues you may find in the bug tracker on github. You can find it [here.](https://github.com/elegoev/basebox-ubuntu-18.04-mate/issues)
