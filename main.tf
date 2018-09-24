provider "vsphere" {
  allow_unverified_ssl = true
  vsphere_server = "${var.vsphere_server}"
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
}


data "vsphere_datacenter" "my_datacenter" {
  name = "${var.vsphere_datacenter_name}"
}

data "vsphere_compute_cluster" "my_cluster" {
  name          = "${var.vsphere_cluster_name}"
  datacenter_id = "${data.vsphere_datacenter.my_datacenter.id}"
}

data "vsphere_resource_pool" "my_resource_pool" {
  name          = "${var.vsphere_resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.my_datacenter.id}"
}

data "vsphere_network" "my_network" {
  name          = "${var.vsphere_network_name}"
  datacenter_id = "${data.vsphere_datacenter.my_datacenter.id}"
}

data "vsphere_virtual_machine" "my_vm_template" {
  name          = "${var.vsphere_virtual_machine_template}"
  datacenter_id = "${data.vsphere_datacenter.my_datacenter.id}"
}

data "vsphere_datastore" "my_datastore" {
  name          = "${var.vsphere_datastore_name}"
  datacenter_id = "${data.vsphere_datacenter.my_datacenter.id}"
}

resource "vsphere_virtual_machine" "my_vm" {
  name             = "${var.vsphere_virtual_machine_name}"
  resource_pool_id = "${data.vsphere_resource_pool.my_resource_pool.id}"
  datastore_id     = "${data.vsphere_datastore.my_datastore.id}"
  folder           = "${var.vsphere_virtual_machine_folder}"
  num_cpus         = "${var.vsphere_num_cpus}"
  memory           = "${var.vsphere_ram_size}"
  guest_id         = "${data.vsphere_virtual_machine.my_vm_template.guest_id}"
  scsi_type        = "${data.vsphere_virtual_machine.my_vm_template.scsi_type}"

  disk {
    label            = "disk0"
    size             = "${data.vsphere_virtual_machine.my_vm_template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.my_vm_template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.my_vm_template.disks.0.thin_provisioned}"
  }

  disk {
    label            = "disk1"
    size             = "${var.vsphere_disk1_size}"
    thin_provisioned = "${data.vsphere_virtual_machine.my_vm_template.disks.0.thin_provisioned}"
    unit_number      = 1
  }

  network_interface {
    network_id   = "${data.vsphere_network.my_network.id}"
    adapter_type = "${data.vsphere_virtual_machine.my_vm_template.network_interface_types[0]}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.my_vm_template.id}"
  }

}
