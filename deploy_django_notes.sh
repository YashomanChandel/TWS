#!/bin/bash

<<task
deploy a django app
and handle errors
task

code_clone()
{
	echo "cloning the django app.."
	git clone https://github.com/LondheShubham153/django-notes-app.git
}

install_requirements()
{
	
	
	sudo chown $USER /var/run/docker.sock
	echo "Installing dependencies"
	sudo apt-get install nginx -y
	sudo systemctl restart docker
}

required_restarts()
{
	sudo systemctl enable nginx
	sudo systemctl enable docker
}

deploy()
{

docker build -t notes-app .
docker run -d -p 8000:8000 notes-app:latest
}

echo "******* Deployment Started *******"
if ! code_clone; then
	echo "the code directory already exists"
	cd django-notes-app
fi

if ! install_requirements; then
	echo "Installation failed"
	exit 1
fi
if ! required_restarts; then
	echo "system fault identified"
	exit 1
fi
if ! deploy; then
	echo "Deployment failed mailing the admin"
	#sendmail
	exit 1
fi

echo "****** Deployment Ended *******"
