# **Terraform is a infrastructure provisioning tool that leverages IAC I nfrastructure As Code to provision resources either locally or on the cloud It keeps the state of your infrastrucure and makes it easy to add or remove resources.**

# **Project Description**
In this project I use Terraform to provision 2 Ec2 t2-micro instances connected to a security group in a the default vpc. Moreover the instances are connceted to an Elastic Load Balancer and s3 bucket.

The terraform backend is localized though when working with teams it is advisable to have it remotely stored for example in an s3 bucket locked by Dynamo db to restrict access by multi-users at a time or on terraform cloud.

The terraform config is split into two parts the variables.tf files and the main.tf file on intitialization more files are generated such as the lock file and after running terraform apply a  statefile is created as well.It is important to keep the statefile out of SCMs and or easily accessible as they contain sensitive information about the state infrastrucure.

The infrastructure is provisioned through jenkins. A jenkins pipeline Job is setup to be triggered by changes to the GitSCM. The Jenkinsfile contains all the steps the jenkins agent will follow to achieve the desired infra state. The Necessary credentials are passed through as environmental variables for security and role based jenkins access further bolsters this.

# **Technical State**
Jenkins version 2.385
Terraform version 1.3.7


