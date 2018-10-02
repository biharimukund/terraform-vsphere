PHONY: vars init plan apply all

vars:
	/home/jenkins/vars .
init:
	terraform init
plan:
	terraform plan
apply:
	terrafrom apply
all: vars init plan 
