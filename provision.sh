if [ ! -f /usr/bin/ansible-playbook ]
    then
    apt-get install -y software-properties-common
    apt-add-repository ppa:ansible/ansible
    apt-get update

    # To be able to use the `lxc-container` task, comment if not used
    apt-get install -y ansible lxc lxc-dev python python-dev python-pip
    pip install lxc-python2
fi

# Self-provisionning with Ansible
ansible-playbook --inventory="localhost," -c local /vagrant/ansible/playbook.yml
