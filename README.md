# terraform-vsphere

This terraform repo can be used to provision VMs in vcenter. To run it without CI/CD, please export below in order to use it:


```
export TF_VAR_vsphere_user=<username to connect vcenter>
export TF_VAR_vsphere_password=<password to connect vcenter>
export TF_VAR_vsphere_server=<vcenter name>
export TF_VAR_vsphere_network_name=<vlan in which VM needs to be created>
export TF_VAR_vsphere_virtual_machine_template=< vm template name to be used>
export TF_VAR_vsphere_resource_pool=<resource pool in vcenter where VM needs to be created>
export TF_VAR_vsphere_datastore_name=<datastore name in which VM needs to be connected>
export TF_VAR_vsphere_datacenter_name=<datacenter name>
export TF_VAR_vsphere_virtual_machine_folder=<folder in which VM needs to be created>
export TF_VAR_vsphere_cluster_name=<vcenter cluster in which VM needs to be created>
export TF_VAR_vsphere_virtual_machine_name=<vm name to be created>
export TF_VAR_vsphere_cluster_name=<vcenter cluster name>
export TF_VAR_vsphere_num_cpus=2
export TF_VAR_vsphere_ram_size=2048
export TF_VAR_vsphere_disk1_size=100
```

Once exported then run :
```
make all
```
