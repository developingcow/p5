Group member(s): Hong

https://github.com/developingcow/p5


![p5](https://github.com/developingcow/p5/assets/155276353/1e0550c6-2b72-4140-9e4a-a03211d42b00)

This terraform sets up a simple fastapi server and a db server on aws. The fastapi server serves content from the data in the db instance.

Instructions: Requires Terraform, appropriate aws creds setup beforehand

1. `terraform init`

2. `terraform apply`to create resources

3. `terraform destroy` to delete resources created

After it's setup, try curling GET requests from `<ip>:1234`, there are 3 demo endpoints set up, ie. /chickens /points /players

Alternatively go to `<ip>:1234/docs` to see the endpoints laid out by Swagger UI

Example:

`terraform apply -var='local_ip=12.34.56.78/32' -var='ssh_key=YOUR_KEY_NAME'`

you can also do `terraform apply` and fill in the variables as prompted.

Example:

`terraform destroy -var='local_ip=12.34.56.78/32' -var='ssh_key=YOUR_KEY_NAME'`

api-user-data.sh, db-user-data.sh are scripts that will be run when setting up corresponding ec2 instances

Note:
1. A lot of stuff (data, passwords) is hardcoded in user-data scripts, but ideally they can be done in s3 buckets, secrets manager etc
