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

humans: we are creating roles for humans
no-humans: we are craeting roles for non-humans(ex: ec2)
