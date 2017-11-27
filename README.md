# ResourceSpace v8.1 Docker Container
ResourceSpace running on Apache2 Docker Container Built on phusion/baseimage

## Example usage:
```
docker run -p 80:80 \
creecros/resourcespace-docker
```
```
docker run -p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=Un1C0rn \
-e MYSQL_DATABASE=resourcespace \
mysql:5.6
```

*Do not use with latest Mysql, use 5.6

To create volumes on the host, create the volumes with docker volume create

In resourcespace Installation, seem to not be able to specify a port, so either map to 3306 or use the private IP during install.

## docker-compose example
```
version: '2'
services:
  resourcespace:
    image: creecros/resourcespace-docker:latest
    stdin_open: true
    network_mode: bridge
    tty: true
    ports:
      - 80:80/tcp
    volumes:
      - include:/include
      - filestore:/filestore
  mysql-resourcespace:
    image: mysql:5.6
    environment:
      MYSQL_DATABASE: resourcespace
      MYSQL_ROOT_PASSWORD: Un1c0rn
    stdin_open: true
    network_mode: bridge
    tty: true
    ports:
      - 3306:3306/tcp

volumes:
  filestore:
    driver: local
    driver_opts:
      type: none
      device: /mnt/resourcespace/filestore
      o: bind
  include:
    driver: local
    driver_opts:
      type: none
      device: /mnt/resourcespace/include
      o: bind
  ```
