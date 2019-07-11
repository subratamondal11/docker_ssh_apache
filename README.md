# docker_ssh_apache

create a docker image with ssh and apache2 services with Ubunt 14.04 base

Steps:

download the repository

##cd to the repository directory
$ cd docker_ssh_apache

create docker image (dont forget the . in end of the command)
$ docker build -t ubuntu_ssh_apache .

run the image in a container
$ docker run -d ubuntu_ssh_apache

view container ID
$ docker ps

view IP of the running container
$ docker inspect <containerID> | grep IP

do ssh or browse the IP from a browser
