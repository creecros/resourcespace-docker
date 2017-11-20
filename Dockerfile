FROM phusion/baseimage:0.9.16                                                                                                                            
MAINTAINER creecros <creecros@gmail.com>                                                                                                                 
ENV HOME /root                                                                                                                                           
CMD ["/sbin/my_init"]                                                                                                                                    
RUN apt-get update                                                                                                                                       
RUN apt-get -y upgrade                                                                                                                                   
ENV DEBIAN_FRONTEND noninteractive                                                                                                                       
RUN locale-gen cs_CZ.UTF-8                                                                                                                               
RUN locale-gen de_DE.UTF-8                                                                                                                               
RUN locale-gen es_ES.UTF-8                                                                                                                               
RUN locale-gen fr_FR.UTF-8                                                                                                                               
RUN locale-gen it_IT.UTF-8                                                                                                                               
RUN locale-gen pl_PL.UTF-8                                                                                                                               
RUN locale-gen pt_BR.UTF-8                                                                                                                               
RUN locale-gen ru_RU.UTF-8                                                                                                                               
RUN locale-gen sl_SI.UTF-8                                                                                                                               
RUN locale-gen uk_UA.UTF-8                                                                                                                               
RUN add-apt-repository ppa:mc3man/trusty-media                                                                                                           
RUN apt-get update                                                                                                                                       
RUN apt-get -y install apache2 php5 php5-dev php5-gd php5-mysql subversion vim nano imagemagick ghostscript \                                            
        antiword xpdf mysql-client libav-tools postfix libimage-exiftool-perl cron wget ffmpeg zip php5-imap                                             
RUN a2enmod php5                                                                                                                                         
RUN a2enmod rewrite                                                                                                                                      
ENV APACHE_RUN_USER www-data                                                                                                                             
ENV APACHE_RUN_GROUP www-data                                                                                                                            
ENV APACHE_LOG_DIR /var/log/apache2                                                                                                                      
ENV APACHE_LOCK_DIR /var/lock/apache2                                                                                                                    
ENV APACHE_PID_FILE /var/run/apache2.pid                                                                                                                 
RUN sed -i -e "s/upload_max_filesize\s*=\s*2M/upload_max_filesize = 1G/g" /etc/php5/apache2/php.ini                                                      
RUN sed -i -e "s/post_max_size\s*=\s*8M/post_max_size = 1G/g" /etc/php5/apache2/php.ini                                                                  
RUN sed -i -e "s/max_execution_time\s*=\s*30/max_execution_time = 1000/g" /etc/php5/apache2/php.ini                                                      
RUN sed -i -e "s/memory_limit\s*=\s*128M/memory_limit = 1G/g" /etc/php5/apache2/php.ini                                                                  
WORKDIR /var/www/html                                                                                                                                    
RUN rm index.html                                                                                                                                        
RUN svn co http://svn.resourcespace.com/svn/rs/releases/8.3/ .                                                                                           
RUN mkdir filestore                                                                                                                                      
RUN chmod 777 filestore                                                                                                                                  
RUN chmod -R 777 include                                                                                                                                 
RUN mkdir /etc/service/apache2                                                                                                                           
COPY conf/apache2.sh /etc/service/apache2/run                                                                                                            
RUN chmod a+x /etc/service/apache2/run                                                                                                                   
WORKDIR /                                                                                                                                                                                                                                                                                       
EXPOSE 80   
