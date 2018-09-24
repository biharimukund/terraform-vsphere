variable "vsphere_server" {
  description = "vCenter URL"
  type        = "string"
}


variable "vsphere_user" {
  description = "vCenter user name"
  type        = "string"
}

variable "vsphere_password" {
  description = "vCenter password"
  type        = "string"
}

variable "vsphere_network_name" {
  description = "VLAN network associated with VMs"
  type        = "string"
}

variable "vsphere_virtual_machine_template" {
  description = "Template to be used to create VMs in vcenter"
  type        = "string"
}

variable "vsphere_resource_pool" {
  description = "Vcenter resource pool in which machines will get created."
  type        = "string"
}

variable "vsphere_datastore_name" {
  description = "Vcenter datastore name in vcenter."
  type        = "string"
}

variable "vsphere_datacenter_name" {
  description = "Name of datacenter in Vcenter"
  type        = "string"
}

variable "vsphere_cluster_name" {
  description = "Name of datacenter in Vcenter"
  type        = "string"
}

variable "vsphere_virtual_machine_name" {
  description = "Host names of VM instances to be created."
  type        = "string"
}

variable "vsphere_virtual_machine_folder" {
  description = "Folder in Vcenter where VMs will get created."
  type        = "string"
}

variable "vsphere_num_cpus" {
  description = "CPU of VM to be created."
  type        = "string"
}

variable "vsphere_ram_size" {
  description = "RAM of VM to be created."
  type        = "string"
}

variable "vsphere_disk1_size" {
  description = "RAM of VM to be created."
  type        = "string"
}

