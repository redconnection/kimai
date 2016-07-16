Dockerized Kimai time tracker
================================

# Introduction

Docker image for running Kimai in a box


# Getting Started

Configured MySQL users:passwords:

root:"empty password"

admin:"pass"

Configured MySQL databases:

kimai


Exposed ports:

80


Deployment:

The below command can be used to download and create a new docker container called kimai and link your docker host system's port 80 with container's exposed port 80.

docker run -d --name=kimai -p 80:80 -v /path/in/host:/var/lib/mysql pliguori/kimai

The bootstrap script will take care of understanding whether or not to create a new DB.

Since there is still some problem with the startup via supervisord, you will also need to execute the following, after starting the container:

docker exec -it kimai mysqladmin -uadmin -ppass create kimai


Usage:

Once you deploy a new docker kimai container using the above command, you can immediately access its installation wizard by pointing your browser to http://localhost. From here, simply follow Kimai's installation wizard by using the configuration settings provided above. Once your installation is complete Kimai will complain about the existence of the installer directory. To stop this message from appearing simply remove installer directory:
docker exec kimai rm -fr /var/www/html/installer


Additional information:

Use the following command to update or reset MariaDB user password. The below command will set a new admin user password:

docker exec -it kimai mysqladmin -uadmin -ppass password abc123


To create a new database eg. kimai2 enter:

docker exec -it kimai mysqladmin -uadmin -ppass create kimai2



# References
Based on Linuxconfig's dockerized Kimai

# Copyright Stuff
Copyright 2016 Pietro Liguori

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

