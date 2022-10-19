# Apache template to Angular #

If you want to put your projects inside a webserver using docker, this template will help you to do this.

## Running Apache ##

* Create an image using "docker build -t raccoon/apache:latest ."
* Run "docker compose up -d" to start your docker container using image created with DockerFile
* Your project will run in http://localhost:80

## Installing a new Angular project ##

* Create a new directory to every new Angular project you want
* Put inside the directory a copy of .htaccess like project_example/.htaccess and change the last command to put your directory name.

## Warning ##

Conf files (/conf) are necessary to .htaccess work on apache.

By default, angular routes does not work on apache, so this files are required because it have all the necessary permissions changed.
