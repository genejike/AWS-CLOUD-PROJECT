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

![Alt text](../images%20/week%200%20image%20/added%20gmail.png)

You can either click on the manage billing alerts icon or the try the new budgets feature 

1.click on the manage billing alerts icon and it opens up cloud watch 
to set up your alarms click on the in alarm and create alarm then click select metric

![Alt text](../images%20/week%200%20image%20/create-alarm.png)
select billing and total estimated charges 
click on the currency and click select metric. change the metric name and scroll down and define the threshold value
select an sns topic if you have one created or create a new one fill in apprioptely and click next 
add the alarm name click next .
preview your actions and create 

![Alt text](../images%20/week%200%20image%20/alarm-created.png)

2.click on budgets and click on create budgets
![Alt text](../images%20/week%200%20image%20/budgets.png)
follow the steps to create 
your final icon should look like this 
![Alt text](../images%20/week%200%20image%20/created-budget.png)

you can also check out your cost allocation tags 