# openshift-ansible-installer
## All-In-One
1. git clone https://github.com/openshift/openshift-ansible. 
2. In the project directory, checkout the correct branch: 
```
git checkout release-1.5
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



