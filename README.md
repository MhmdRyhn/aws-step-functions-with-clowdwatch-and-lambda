# AWS Step Functions with Cloudwatch and Lambda
Triggering AWS Step Functions from CloudWatch rule to execute a series of Lambda Functions based on condition. 
Rules are cron jobs and set using **Cloudwatch event rule**. At some specified time it triggers the Step Function. 
The execution flow is as follows:

1. Cloudwatch rule triggers step function (the state machine).
2. Initial state fires a lambda named *collector_lambda*.
3. Collector lambda executes its job and then pass its output to the next state.
4. This state decides based on the output of the collector_lambda which lambda to call next.
5. Based on the decision of the state, either the *sender_lambda* or *rejection_lambda* is fired.
6. The fired lambda returns output and the state machine reach its end.


# Commands To Manipulate Resources
First enter into **terraform** directory to run the following commands.

- Installs required terraform plugins. See more details 
[**here**](https://www.terraform.io/docs/commands/init.html)
```
terraform init
```
- **View execution plan**
```
terraform plan --var-file input_value.tfvars
```

- **Apply the configurations** 
```
terraform apply --var-file input_value.tfvars --auto-approve
```
Remove `--auto-approve` option from the above command to approve manually (by inputting prompt).

If the input file is named exactly `terraform.tfvars` or any variation of `*.auto.tfvars`, those 
will be loaded automatically, you don't need to pass `--var-file` option with the command. In this 
case the command is as following.
```
terraform apply --auto-approve
```
And, the **JSON** version of the input files follows the same above rules.

- **Destroy all resources**
```
terraform destroy --var-file input.tfvars --auto-approve
```
Remove `--auto-approve` option from the above command to approve manually (by inputting prompt).

