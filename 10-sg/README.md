## SG module user
When creating a security group, the first required input is the vpc_id, because a security group must belong to a VPC. The vpc_id was already stored in AWS SSM Parameter Store by the VPC module user.

To retrieve that value in Terraform, we use a data source, which allows us to fetch existing information.
After the security group is created, the module returns the sg_id as an output. As a module user, we are responsible for capturing that sg_id from the security group module and storing it in AWS SSM Parameter Store, so other modules (such as EC2, ALB, etc.) can retrieve and use it later.
