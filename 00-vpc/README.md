# VPC Module user
The module user passes the required input variables to the VPC module. The module then creates the VPC and returns the outputs.
The user captures these outputs (for example, vpc_id) and stores them in AWS SSM Parameter Store.
Once the outputs are stored, the module user’s work is complete.


# Outputs:
When you capture the outputs from the VPC module developed by the module developer, you need to store the public, private, and database subnet IDs.
However, the module returns these values as a list of subnet IDs (for example, two subnet IDs for each subnet type).
So, when storing them in AWS SSM Parameter Store, we use the join function to convert the list of subnet IDs into a single comma-separated string.

Testing
