FROM pliguori/lamp
MAINTAINER Pietro Liguori <pliguori@gmail.com>

# Install prerequisites
RUN apt-get update
RUN apt-get install -y wget unzip

# Download and unzip Concrete5 
RUN wget -O /tmp/kimai.zip https://github.com/kimai/kimai/releases/download/1.1.0/kimai_1.1.0.zip
RUN wget -O /tmp/kimai-mobile.zip https://github.com/kimai/kimai-mobile/archive/master.zip
RUN rm -fr /var/www/html/*
RUN unzip /tmp/kimai.zip  -d /var/www/html/
RUN unzip /tmp/kimai-mobile.zip -d /var/www/html/
RUN mv /var/www/html/kimai-mobile-master /var/www/html/mobile

ADD run.sh /run.sh
ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh
RUN chmod 755 /*.sh

# Create database
#RUN service mysql restart; mysqladmin -uadmin -ppass create kimai

# Update file ownership
RUN chown -R www-data.www-data /app

# Allow ports
EXPOSE 80

CMD ["/run.sh"]
