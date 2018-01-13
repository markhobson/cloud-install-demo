#!/bin/bash

STACK_NAME=cloud-install-demo
COMMAND=$1

case $COMMAND in
	"up")
		aws cloudformation create-stack \
			--stack-name $STACK_NAME \
			--template-body file://stack.yml \
			--capabilities CAPABILITY_IAM
		;;
	"down")
		aws cloudformation delete-stack \
			--stack-name $STACK_NAME
		;;
	*)
		echo "Usage: stack [up | down]"
		;;
esac
