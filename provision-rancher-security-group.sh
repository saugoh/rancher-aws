aws ec2 create-security-group --group-name rancher-ui --description "Rancher UI"
aws ec2 authorize-security-group-ingress --group-name rancher-ui --protocol tcp --port 22 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-name rancher-ui --protocol tcp --port 2376 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-name rancher-ui --protocol tcp --port 8080 --cidr 0.0.0.0/0
