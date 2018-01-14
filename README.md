# Cloud Install Demo

Easily install serverless applications to your private cloud.

[![Launch Stack](https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png)](https://console.aws.amazon.com/cloudformation/home#/stacks/new?stackName=cloud-install-demo&templateURL=https://s3.eu-west-2.amazonaws.com/cloud-install-demo/stack.yml)

## What's all this then?

Imagine an app store of serverless web applications. Each application has a 'Launch Stack' button like the one above that installs it to your private cloud. A private cloud that you control, own the data of, and pay for. No more site shutdowns, data mining, nor adverts.

## How does it work?

[AWS CloudFormation](https://aws.amazon.com/cloudformation/) allows serverless architectures to be scripted and programmatically created using CloudFormation templates. The ['Launch Stack' button](https://aws.amazon.com/blogs/devops/construct-your-own-launch-stack-url/) above links to the create stack wizard in the AWS CloudFormation console with a preconfigured template. This template must be stored within an AWS S3 bucket. Once the wizard is completed, CloudFormation brings up the infrastructure and the application is ready.

## What does this demo application do?

Not a lot, see [stack.yml](stack.yml). It currently just creates a lambda that says "Hello world!". The idea is to demonstrate the installation process but any CloudFormation template will work.

## How do I set this up?

Firstly, make sure you've installed and configured the [AWS Command Line Interface](https://aws.amazon.com/cli/).

Use the [stack.sh](stack.sh) script to create an S3 bucket for the template:

    ./stack.sh release-up

Then copy the template to the S3 bucket:

    ./stack.sh release

The template now has a public URL that can be used to create a 'Launch Stack' button.

To make your application no longer available, delete the S3 bucket using:

    ./stack.sh release-down

## How can I programmatically launch the stack?

Use the script to create the stack:

    ./stack.sh up

Once you're done with the application, delete the stack using:

    ./stack.sh down
