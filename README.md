# openshift-ansible-installer

## Pre-Req  
1. yum install git ansible puppet  
2. git clone https://github.com/aizuddin85/openshift-ansible-installer.git  
3. cd openshift-ansible-installer  
4. ssh-keygen -t rsa; cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys; chmod 0400 ~/.ssh/authorized_keys
5. Edit /etc/ssh/sshd_config PermitRootLogin without-password; reload sshd 
6. cd openshift-ansible-installer; puppet apply pydeps.pp

## All-In-One
1. git clone https://github.com/openshift/openshift-ansible. 
2. In the project directory, checkout the correct branch: 
```
git checkout release-1.5
cd openshift-ansible; rm -rvf *; git reset --hard
```
3. Run: 
```
ansible-playbook -i openshift-ansible-installer/all-in-one.yml openshift-ansible/playbooks/byo/config.yml
```

## Scale Up. 
official guide: https://docs.openshift.org/latest/install_config/adding_hosts_to_existing_cluster.html 

1. Edit add-node.yml for new_nodes.Note: master addition need special new_nodes and new_master roles.  
2. Run:  
```
ansible-playbook -i openshift-ansible-installer/add-node.yml openshift-ansible/playbook/byo/openshift-node/scaleup.yml
```



