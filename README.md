Ansible Controller
==================

This repository contains configuration to deploy an Ansible Control agent in a VM.


Installation
------------

Install [VirtualBox](https://www.virtualbox.org/)

Install [Vagrant](https://www.vagrantup.com/)

Start and provision the VM:

    vagrant up

Once the installation finished, connect to it via SSH:

    vagrant ssh

__N.B.:__ the Ansible Controller VM is provisioned by the playbook `self-provision.yml` locally executed.

__N.B.2:__ the public and private keys of your laptop's user (the one that execute the vagrant commands) are copied to
the Ansible Controller's `vagrant` user.


Setup
-----

Configure the `hosts` file in `/vagrant/ansible/hosts`. A model and directives about how to set it up are available in
`/etc/ansible/hosts`. You may place group and host specific variables in `group_vars` and `host_vars`.

Place your roles in `/vagrant/ansible/roles/` and your playbooks in `/vagrant/ansible/`.

You are now ready to go:

    cd /vagrant/ansible
    ansible-playbook my_playbook.yml