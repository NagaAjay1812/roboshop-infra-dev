## database
Here we are launching MongoDB in the database subnet, so we need to fetch the database subnet IDs and the MongoDB security group ID. When launching the EC2 instance, we must specify the database subnet ID and attach the MongoDB security group, which is why we fetch these values.

1. Once the instance is launched, we connect to it and configure MongoDB through the bastion server.
2. We also create a Route 53 record for the instance.


## Terraform Data
- If the instance is deleted, Terraform will not create a new resource. However, it will reconfigure the instance when we use the trigger_replace argument.

- The instance is launched through the bastion server.
- We connect to the MongoDB server through the bastion server.
- We copy the 'bootstrap.sh' file to the MongoDB server using the file provisioner.
- Then we execute it using 'remote-exec' by giving execute permission to the bootstrap script and running it.
- All these steps are executed only when the private IP address of the MongoDB server changes.
