# terraform-examples
This is a repository for Terraform configuration examples.
<br />
I tried following <a href="https://cloud.google.com/docs/terraform/best-practices-for-terraforme">the best-practice code structure as recommended by Google</a>, but of course, this is not perfect so I apologize for that.
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
terraform -chdir=../modules/primary-vpc init;
```

To create the plan, we can run this command:
```sh
terraform -chdir=../modules/primary-vpc plan -out "./primary-vpc.tfplan";
```

And, finally, to apply the Terraform plan, we can run this command:
```sh
terraform -chdir=../modules/primary-vpc apply "./primary-vpc.tfplan";
```

In the future, I plan to make separated variable files for different environments (such as for `staging`, `UAT`, or `PROD`).
<br />