# openshift-ansible-installer.
Environment:  
1. GCE Platform  
2. CentOS 7 GCE Official Image  

## Pre-Req  
1. Install required packages.  
```
yum install git ansible puppet  
```  
2. Clone this repo.
```
git clone https://github.com/aizuddin85/openshift-ansible-installer.git  
```
3. Generate the SSH key for root to root.
```
ssh-keygen -t rsa; cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys; chmod 0400 ~/.ssh/authorized_keys
```  
4. Make sure the root login is permitted in /etc/ssh/sshd_config. 
```
PermitRootLogin without-password
```
5. Change directory into the project:
```
cd openshift-ansible-installer  
``` 
6. Run puppet apply for the deps:
```
cd initial_host_puppet_manifests
puppet apply pydeps.pp
```  
7. Your pre-req should be ready now.

## All-In-One
1. Clone the upstream openshift ansible project.
```
git clone https://github.com/openshift/openshift-ansible. 
```  
2. In the project directory, checkout the correct branch: 
```
git checkout release-1.5
```
3. Edit the inventory file to met your environment openshift-ansible-installer/all-in-one.yml. (Cloned from the pre-req)
4. To start installation, run: 
```
ansible-playbook -i openshift-ansible-installer/all-in-one.yml openshift-ansible/playbooks/byo/config.yml
```

## Post-In
1. In the inventory file above, we are using htpass as the credentials mean. To access the dashboard, create htpass:
```
htpasswd -c /etc/origin/master/htpasswd userone
```
Note: For subsequent user remove the `-c` flag, or your previous /etc/origin/master/htpasswd will be gone.  
2. Access the dashboard at https://yourhost.example.com:8443.  



## Scale Up. 
official guide: https://docs.openshift.org/latest/install_config/adding_hosts_to_existing_cluster.html 

1. Edit add-node.yml for new_nodes.Note: master addition need special new_nodes and new_master roles.  
2. Run:  
```
ansible-playbook -i openshift-ansible-installer/add-node.yml openshift-ansible/playbook/byo/openshift-node/scaleup.yml
```


