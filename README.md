
# Terraform AWS S3 Bucket Cleaner


This Terraform project creates an AWS Lambda function that cleans up an S3 bucket everyday at 12:00AM EST. 

It also sends alerts if any files found in the bucket after is empty.

This is a code assesment project for Success Academy Charter Schools. 


## Documentation


Before executing the project
```bash
Create an AWS Account
Install AWS CLI and Configured it
Install Terraform CLI
```


Configure AWS Credentials in Your Environment.
```bash
export AWS_ACCESS_KEY_ID="your-aws-access-key-id"
export AWS_SECRET_ACCESS_KEY='your-aws-secret-access-key-id"
```


Clone the project first

```bash
git Clone https://github.com/Haji001/reporting-files.git
```

Change to the 'reporting-files' directory
```bash
cd reporting-files
```

Initialize Terraform
```bash
terraform init
```

See Preview of Actions Terraform Would Take Before 'terraform apply'
```bash
terraform plan
```

After you ensure that it creates the resources that you expect.
Apply to create the resources.
```bash
terraform apply
```

After verifying in the AWS console that Lambda function was created. Wait until Sunday at 12:00AM EST to get a notification if any files are found in the bucket. Then delete the resources. 
```bash
terraform destroy
```
## Authors

- [@Haji001](https://www.github.com/Haji001)

