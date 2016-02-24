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

Access the Rancher UI via http://<ec2_public_ip>:8080

