PHONY: vars init plan apply all

vars:
	/home/jenkins/vars.sh
init:
	terraform init
plan:
	terraform plan
apply:
	terrafrom apply
all: vars init plan 
