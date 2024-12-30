FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y adminer && \
    apt-get install -y php php-mysql && \
    apt-get install -y wget && \
    wget "http://www.adminer.org/latest.php" -O /var/www/html/index.php

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]