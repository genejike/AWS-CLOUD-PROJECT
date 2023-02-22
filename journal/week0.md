# Week 0 — Billing and Architecture
### step 1
In order to adequately prepare for the program ,watch thoroughly this [video](https://www.youtube.com/playlist?list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv
) by andrew brown 


Follow the following steps to get prepared :

1.Create a [Github Account](https://www.youtube.com/watch?v=rirBD2CZZXQ&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=2). 

1b.Make sure to turn on your [MFA](https://www.youtube.com/watch?v=oDSeqvRmEUI&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=3)

2.Create a [Gitpod account](https://www.youtube.com/watch?v=yh9kz9Sh1T8&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=4).


3.Create [Github CodeSpace](https://www.youtube.com/watch?v=yh9kz9Sh1T8&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=4)

3b.Add the github [extension](https://www.youtube.com/watch?v=A6_c-hJmehs&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=5)


3c. create your [github code space](https://www.youtube.com/watch?v=OwFVrU5B3xs&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=6)

4.Create the [AWS account](https://www.youtube.com/watch?v=uZT8dA3G-S4&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=7)

4b. After setting up your repository create your repository from the [template](https://www.youtube.com/watch?v=8cxYgaMB9ow&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=8) provided 


5.Create [Lucidchart](https://www.youtube.com/watch?v=bgFzBYLT3sU&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=9)

6.Create [Honeycomb.io account](https://www.youtube.com/watch?v=7IwtVLfSD0o&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=10).

7.Create [Rollbar account](https://www.youtube.com/watch?v=Lpm6oAP3Fb0&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=11).

## Billing setup 
KINDLY FOLLOW THESE [BILLING](https://www.youtube.com/watch?v=OVw3RrlP-sI&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=14) STEPS IN THIS VIDEO

Search billing in the aws console 
click on bills to view your bills summary and billing  details
if your on a free tier account click on free tier to see your usage statistics
### Set up billing alerts
1.click on billing preferences and input your email to receive billing alerts by email

![Alt text](/Journal-images/image-0/added-gmail.png)

You can either click on the manage billing alerts icon or the try the new budgets feature 

1.click on the manage billing alerts icon and it opens up cloud watch 
to set up your alarms click on the in alarm and create alarm then click select metric

![Alt text](/Journal-images/image-0/create-alarm.png)
select billing and total estimated charges 
click on the currency and click select metric. change the metric name and scroll down and define the threshold value
select an sns topic if you have one created or create a new one fill in apprioptely and click next 
add the alarm name click next .
preview your actions and create 

![Alt text](/Journal-images/image-0/alarm-created.png)

2.click on budgets and click on create budgets
![Alt text](/Journal-images/image-0/budgets.png)
follow the steps to create 
your final icon should look like this 
![Alt text](/Journal-images/image-0/created-budget.png)

you can also check out your cost allocation tags ,cost explorer,credits ,billing calculator and free tier services offered which are  all explained in the video

## Conceptual Diagram 
A conceptual model is a representation of a system. It consists of concepts used to help people know, understand, or simulate a subject the model represents. 

This is [MY CONCEPTUAL MODEL](https://lucid.app/lucidchart/fbd3e4e9-635b-4ff3-8d37-5123310d8641/edit?invitationId=inv_a3ec831b-29f3-4106-8e87-d65d0a241263)

Napkin design
![Alt text](/Journal-images/image-0/conceptual-diagram.png)



###  This is [My Logical Diagram](https://lucid.app/lucidchart/5f28964b-e389-4943-8ab3-b2009bf6c0b4/edit?viewport_loc=-11%2C-10%2C1472%2C628%2C0_0&invitationId=inv_a4f519de-cb75-41f6-94d0-14051236e04b)
![Alt text](/Journal-images/image-0/updated%20logical%20diagram.png)







## Cloud security

[AWS organizations and IAM Tutorial](https://www.youtube.com/watch?v=4EMWBYVggQI&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=15)
### Setting up your MFA 
These can be done in 2 ways 
1.Search for IAM on the search page and click on it .

Alternatively 

2.you can go to the account section and click on the security credentials 

![Alt text](/Journal-images/image-0/security-credentials1.png)

write a device name and select an MFA device
and complete the steps . i used the mobile phone authenticator

![Alt text](/Journal-images/image-0/MFA.png)

### Aws organizations
A central management for multiple aws accounts.
Go to the aws organization and create an organization unit click on roots scroll down and create an organisation unit also remember to add tags form the habit of tagging 

![Alt text](/Journal-images/image-0/organisation-unit.png)
You can explore the actions button to see what you can do 

### AWS Cloud Trail
for Monitoring  Data Security and Residence
for audit logs
understanding the region vs availabilityzone vs global zone concept
click on cloud trail and set it up

### IAM USERS
1.Go to the IAM user 

2.Click on the add user 

3.Specify the user details 

4.Set permissions

Review and create 
![Alt text](/Journal-images/image-0/Retrive-password.png)

![Alt text](/Journal-images/image-0/user-created.png)

Set up the MFA also for this account

## AWS CLI

Install AWS CLI

The bash commands we are using are the same as the [AWS CLI Install Instructions](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

Update our .gitpod.yml to include the following task.

     tasks:
     - name: aws-cli
     env:
      AWS_CLI_AUTO_PROMPT: on-partial
    init: |
      cd /workspace
      curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
      unzip awscliv2.zip
      sudo ./aws/install
      cd $THEIA_WORKSPACE_ROOT

Run these commands indivually to perform the install manually

Create a new User and Generate AWS Credentials

create a new user
Enable console access for the user
Create a new Admin Group and apply Administrator Access
Create the user and go find and click into the user
Click on Security Credentials and Create Access Key
Choose AWS CLI Access
Download the CSV with the credentials
Set Env Vars
set these credentials for the current bash terminal

`export AWS_ACCESS_KEY_ID=""`

`export AWS_SECRET_ACCESS_KEY=""`

`export AWS_DEFAULT_REGION=us-east-1`

We'll tell Gitpod to remember these credentials if we relaunch our workspaces

`gp env AWS_ACCESS_KEY_ID=""`

`gp env AWS_SECRET_ACCESS_KEY=""`

`gp env AWS_DEFAULT_REGION=us-east-1`


Check that the AWS CLI is working and 

`aws sts get-caller-identity`

![Alt text](/Journal-images/image-0/caller_identity1.png)

Enable Billing using cli

In your Root Account go to the Billing Page
Under Billing Preferences Choose Receive Billing Alerts

Save Preferences

Creating a Billing Alarm

Create SNS Topic

We need an SNS topic before we create an alarm.
The SNS topic is what will deliver to us an alert when we get overbilled

`aws sns create-topic`

We'll create a SNS Topic

`aws sns create-topic --name billing-alarm`

which will return a TopicARN

We'll create a subscription supply the TopicARN and our Email

    aws sns subscribe \
    --topic-arn TopicARN \
    --protocol email \
    --notification-endpoint your@email.com
Check your email and confirm the subscription

![Alt text](/Journal-images/image-0/billingandbudget.png)

### Create Alarm
`aws cloudwatch put-metric-alarm`

### Create an Alarm via AWS CLI

We need to update the configuration json script with the TopicARN we generated earlier

    aws cloudwatch put-metric-alarm --cli-input-json file://aws/json/alarm_config.json


Create an AWS Budget via Awscli

`aws budgets create-budget`

Get your AWS Account ID

`aws sts get-caller-identity --query Account --output text`

Supply your AWS Account ID
Update the json files


    aws budgets create-budget \
    --account-id AccountID \
    --budget file://aws/json/budget.json \
    --notifications-with-subscribers file://aws/json/budget-notifications-with-subscribers.json


