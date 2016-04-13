# Copy private and public key to current user
echo "$2" > "/home/$1/.ssh/id_rsa"
chmod 400 "/home/$1/.ssh/id_rsa"
chown "$1:$1" "/home/$1/.ssh/id_rsa"
echo "$3" > "/home/$1/.ssh/id_rsa.pub"
chown "$1:$1" "/home/$1/.ssh/id_rsa.pub"
# Copy private and public key to root user
echo "$2" > /root/.ssh/id_rsa
chmod 400 /root/.ssh/id_rsa
echo "$3" > /root/.ssh/id_rsa.pub

# Install Ansible
if [ ! -f /usr/bin/ansible-playbook ]
    then
    apt-get install -y software-properties-common
    apt-add-repository ppa:ansible/ansible
    apt-get update

    # To be able to use the `lxc-container` task, comment if not used
    apt-get install -y ansible lxc lxc-dev python python-dev python-pip
    pip install lxc-python2
    pip install passlib
fi
cp /vagrant/ansible/ansible.cfg /home/$1/.ansible.cfg

# Self-provisionning with Ansible
ansible-playbook --inventory="localhost," -c local /vagrant/ansible/self-provision.yml
