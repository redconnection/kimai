FROM pliguori/lamp
MAINTAINER Pietro Liguori <pliguori@gmail.com>

# Install prerequisites
RUN apt-get update
RUN apt-get install -y wget unzip

# Download and unzip Concrete5 
RUN wget -O /tmp/kimai.zip https://github.com/kimai/kimai/releases/download/1.0.1/kimai_1.0.1.zip
RUN rm -fr /var/www/html/*
RUN unzip /tmp/kimai.zip  -d /var/www/html/


# Create database
RUN service mysql start; mysqladmin -uadmin -ppass create kimai

# Update file ownership
RUN chown -R www-data.www-data /var/www/html

# Allow ports
EXPOSE 80

CMD ["supervisord"]
