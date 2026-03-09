# 🔐 20-sg-rules – Security Group Rules

In the previous module (`10-sg`), we created all the Security Groups required for the Roboshop infrastructure.

However, creating a Security Group alone is not enough.  
We also need to define **who can talk to whom and on which ports**.

That is exactly what this module does.

The `20-sg-rules` module defines **all the communication rules between the infrastructure components** such as Bastion, ALB, Application servers, and Databases.

---

## 📂 Folder Structure

```
20-sg-rules/
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md
```

---

## 📌 What This Module Does

This module adds **rules to the security groups** created earlier.

Examples of rules configured here:

- Bastion → All servers (SSH access)
- Frontend ALB → Backend servers
- Backend ALB → Application instances
- Application servers → Database servers
- Application servers → Redis / RabbitMQ

Instead of allowing everything, we only allow **specific traffic between specific components**.

This keeps the infrastructure secure.

---

## 🔧 Example Security Group Rule

Below is a simple example of how a rule is defined:

```hcl
resource "aws_security_group_rule" "backend_to_app" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = var.app_sg_id
  source_security_group_id = var.backend_sg_id
}
```

This rule allows **backend servers to communicate with application servers on port 8080**.

---

## 🏗 Why We Keep SG and SG Rules Separate

Instead of putting everything in one module, we separate them:

- `10-sg` → Creates Security Groups
- `20-sg-rules` → Defines rules for those groups

This separation makes the code:

- Easier to read
- Easier to maintain
- Easier to update rules later

It also follows a **clean infrastructure design pattern used in real DevOps projects**.

---

## 🚀 Deployment Order

This module runs **after the Security Groups are created**.

Typical order:

```
00-vpc
10-sg
20-sg-rules
```

Terraform automatically connects everything using the Security Group IDs.

---

## 🎯 Final Thought

Security Groups act like **firewalls for your AWS infrastructure**.

This module ensures that:

- Only required ports are open
- Only the right components can communicate
- The infrastructure remains secure and organized