FROM debian:latest

# Apache ENVs
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_SERVER_NAME localhost

# Install Apache and Vim
RUN apt-get update -y && apt-get install -y vim && apt-get install -y apache2

# Copy files
COPY conf/apache2.conf /etc/apache2/apache2.conf
COPY conf/000-default.conf /etc/apache2/sites-enabled/000-default.conf

# Expose Apache
EXPOSE 80

# Launch Apache
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]

# Rewrite Apache conf and restart
RUN a2enmod rewrite
RUN service apache2 restart
