# Rancher on AWS

## Dependencies

AWS CLI installed and working together with Acceess Keys configured

## Installing Rancher on AWS

NOTE: some values are hardcoded in the scripts below so they may need to be changed to work for you.

Create AWS security group

```
./provision-rancher-security-group.sh
```

Provision ec2 instance and run rancher docker image.

```
./provision-rancher-ui.sh
```

Access the Rancher UI via http://server_ip:8080

## Provision EC2 Hosts

Provision at least two EC2 hosts via the Rancher UI. More details can be found at http://docs.rancher.com/rancher/rancher-ui/infrastructure/hosts/amazon/

## Create API key in Rancher

Create API key via the Rancher UI. More details can be found at http://docs.rancher.com/rancher/api/

## Download Rancher Compose CLI

Rancher Compose can be download from the Rancher UI. The link can be found on the lower right corner of the web page. More details can be found at http://docs.rancher.com/rancher/rancher-compose/

Make sure to read through the contents of the link above. You will need to export certain variables for the CLI to work.

## Deploy application via docker-compose and rancher-compose

Files can be found in initial-deploy folder. Take a look at the docker-compose.yml and rancher-compose.yml files for details. This deploys load balancer and two docker applications.

```
cd initial-deploy
rancher-compose --debug -p hello up
```

In Rancher UI, under "APPLICATIONS" you should see a new stack deployed called "hello". There should be links you can click on next to "Ports" that will take you to the hello world page. You need to make sure that the ports are allowed in AWS security group.

## Update application 

Files can be found at update-deploy folder. More details can be found at http://docs.rancher.com/rancher/rancher-compose/upgrading/

```
cd update-deploy
rancher-compose --debug -p hello up --upgrade hello-world
```

So in this example we replace hello-world from tutum/hello-world to nginx.

In Rancher UI, under "APPLICATIONS" you can see that hello-world has been upgraded. If you click on the link you will see a ngnix page response.

In Rancher UI, under "INFRASTRUCTURE" you can see old hello_world container stopped and new hello_world container running.

## Multi Version Deploy

In this deploy we add a new application to the stack called hello-world-v2. Also we add that to the load balancer as well.

```
cd multi-version-deploy
rancher-compose --debug -p hello up
```

In Rancher UI, hello-world-v2 will be deployed into the stack and the hello-lb will be linked to both hello-world and hello-world-v2.

If you access the hello-lb page (the one on port 80), you will alternate between nginx page and hello world page.

