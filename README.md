# terraform-examples
This is a repository for Terraform configuration examples.
<br />
I tried following <a href="https://cloud.google.com/docs/terraform/best-practices-for-terraform">the best-practice code structure as recommended by Google</a>, but of course, this is not perfect so I apologize for that.
<br />
To use this repository, we can just run:
```sh
cd ./terraform-examples/${your-targeted-environment};
```

For example, let's say we want to work in PROD environment:
```sh
cd ./terraform-examples/03.prod;
```

And then, we can initialize the Terraform repository by running this command:
```sh
terraform -chdir=../modules/primary-vpc init -var-file="../../03.prod/prod.tfvars";
```

To create the Terraform plan for this repository, we can run this command:
```sh
terraform -chdir=../modules/primary-vpc plan -out "./primary-vpc.tfplan" -var-file="../../03.prod/prod.tfvars";
```

And, finally, to apply the Terraform plan, we can run this command:
```sh
terraform -chdir=../modules/primary-vpc apply "./primary-vpc.tfplan" -var-file="../../03.prod/prod.tfvars";
```

The var files' (Terraform variable files) location are relative to the `chdir` directory.

That's why we can see that we need to go the parent two level above just to provide the var files.
<br />