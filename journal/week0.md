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

[MY CONCEPTUAL MODEL](https://lucid.app/lucidchart/fbd3e4e9-635b-4ff3-8d37-5123310d8641/edit?invitationId=inv_a3ec831b-29f3-4106-8e87-d65d0a241263)
![Alt text](/Journal-images/image-0/conceptual-diagram.png)
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


