# mysql_docker_connection
This is an example of connecting two container (default bridge network) which are in the same docker host.

This repo contains the docker file to build an tomcat server which host the `index.jsp` page on the container. 

The `Dockerfile` contains the required command to create the image. We have copied the `mysql-connector.jar` file to `tomcat/lib` path.

For the second container which host the mysql server, we have pulled it from docker library and ran it through the below command.

`docker run --name mysql1 -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -d mysql  --default-authentication-plugin=mysql_native_password`

followed by executing `docker exec -it mysql1 /bin/bash` where we created a database `wrk` and a table `inputs`.

Till now there is container running a mysql server whose default ip is `172.17.0.2`.

## Running the tomcat server container

`docker build -t frontend .` To build the docker image.

`docker run -p 8082:8080 frontend` Here we have mapped the 8080 port of docker to 8082 port of host machine to access the server from the host itself. Rest of the job is on the jsp file which connect to database through the IP of mysql container and execute query.

