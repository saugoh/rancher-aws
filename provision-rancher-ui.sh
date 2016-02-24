#!/bin/bash
export AWS_MACHINE_NAME=rancher02
docker-machine create --driver amazonec2 --amazonec2-security-group rancher-ui --amazonec2-region ap-southeast-2 --amazonec2-zone a --amazonec2-subnet-id subnet-c73e6fa2 --amazonec2-instance-type t2.medium $AWS_MACHINE_NAME
eval "$(docker-machine env $AWS_MACHINE_NAME)"
docker run -d --restart=always --name=$AWS_MACHINE_NAME -p 8080:8080 rancher/server
docker ps
echo ""
echo "############################################"
echo "# to look at the logs execute the following:"
echo 'eval "$(docker-machine env $AWS_MACHINE_NAME)"'
echo "docker logs -f $AWS_MACHINE_NAME"
echo ""
echo "# Rancher UI ip address can be found below. Use the IP address on port 8080 in web browser to access the Rancher UI"
docker-machine ls
echo ""
echo "# to stop the container execute the following:"
echo "docker-machine rm $AWS_MACHINE_NAME"
