# ResourceSpace v8.3 Docker Container
ResourceSpace running on Apache2 Docker Container Built on phusion/baseimage

## Example usage:
docker run -p 80:80 \
-v <pat to mount>:/var/www/html/include \
-v <path to mount>:/var/www/html/filestore \
creecros/resourcespace-docker
  
docker run -p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=Un1C0rn \
-e MYSQL_DATABASE=resourcespace \
mysql:5.6

*Do not use with latest Mysql, use 5.6

In resourcespace Installation, seem to not be able to specify a port, so either map to 3306 or use the private IP during install.
