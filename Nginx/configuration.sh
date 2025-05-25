cd /etc/nginx
cat /etc/nginx/nginx.conf #to view the configuration file
nano nginx.conf #to edit the configuration file
cat /etc/passwd | grep nginx #to confirm the user
ps aux |grep nginx #to confirm the process
cat /proc/cpuinfo | grep processor #to confirm the CPU
cat /proc/meminfo | grep MemTotal #to confirm the memory
cat /proc/meminfo | grep SwapTotal #to confirm the swap
ls -l /var/log/nginx #to view the log files
cat -f /var/log/nginx/access.log #to view the access log and follow the log
cat -f /var/log/nginx/error.log #to view the error log and follow the log
cat /etc/nginx/conf.d/default.conf #to view the default configuration file, if we are hosting multiple websites on the server we should create a new configuration file for each website
####FOr dockerized nginx web server
sudo docker logs -f my-nginx-container #to view the logs of the dockerized nginx web server
sudo docker exec -it my-nginx-container /bin/sh #to access the dockerized nginx web server
sudo docker exec -it my-nginx-container nginx -t #to test the configuration file of the dockerized nginx web server
sudo docker exec -it my-nginx-container nginx -s reload #to reload the configuration file of the dockerized nginx web server 
#Using volume to mount the local directory to the dockerized nginx web server
docker run -d --name my-nginx-container -p 80:80 -v /path/on/host/nginx_config:/etc/nginx nginx:stable-alpine #dynamic configuration
#