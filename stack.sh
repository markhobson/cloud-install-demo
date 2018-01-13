#!/bin/bash

BUCKET_NAME=cloud-install-demo
STACK_NAME=cloud-install-demo
TEMPLATE=stack.yml
COMMAND=$1

case $COMMAND in
	"release-up")
		aws s3 mb s3://$BUCKET_NAME
		;;
	"release")
		aws s3 cp $TEMPLATE s3://$BUCKET_NAME/$TEMPLATE \
			--grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers
		;;
	"release-down")
		aws s3 rb s3://$BUCKET_NAME --force
		;;
	"up")
		aws cloudformation create-stack \
			--stack-name $STACK_NAME \
			--template-body file://$TEMPLATE \
			--capabilities CAPABILITY_IAM
		;;
	"down")
		aws cloudformation delete-stack \
			--stack-name $STACK_NAME
		;;
	*)
		echo "Usage: stack [release-up | release | release-down | up | down]"
		;;
esac
