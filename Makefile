PHONY: vars init plan apply all

vars:
	 cp /home/jenkins/vars /var/lib/jenkins/workspace/terraform-vsphere/tf.vars 
init:
	terraform init
plan:
	terraform plan
apply:
	terrafrom apply
all: vars init plan 
