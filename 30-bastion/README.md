## Bastion
We are planning to launch instances through the bastion server, which is why we created the bastion instance.
In Ansible, we usually create and configure instances from one control machine (CM) to other instances. However, in this case we do not need to configure it manually because we already created an IAM role, attached the required permissions, and created an instance profile for the bastion instance.

# IAM role

- noun(name): ec2, s3, lambda ( what resource user can access)
- verb(actions): create ec2, raed s3, trigget lambda (what actions user can perform)

role           permissions
tester          r
Junior devops   r+w
sr.devops       r+w+x
architect       r+w+x+d

humans: we are creating roles for humans.
non-humans: we are craeting roles for non-humans (Ex: EC2).


- login into bastion host clone the repo "roboshop-infra-dev" repo and cd to roboshop-infra-dev there install terraform 
- We need to increase the storage size from 20 GB to 50 GB because the Terraform provider is installed in /home/ec2-user. However, we are currently allocating only 1.1 GB for the home partition, which is not sufficient.

Additionally, we need to create four databases from the bastion host, and each database requires approximately 830 MB of storage. In total, this requires around 3.5 GB of space.
Therefore, we need to increase the disk size and then extend the volume to ensure there is enough storage available.

- once the bastion is created then 'bastion.sh' will execute immediaeltly becoz we added this line "user_data = file(bastion.sh)"


## user_data:
- Once the system provisoned or instance is launched, aws will execute the commands inside the user_data script.
- If user_data is failed, terfform will not aware(still terraform suceess becoz terraform is responsible is only create the infra)
- Since AWS runs user_data we cant get immediate log
- Useful for simple intallation

## provisioner:
- It is terrrfaorm resource.
- remote_exec is fialed terraform is also failed.
- we can get immediate log on console what is going on.