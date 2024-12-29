FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl php7.4-fpm \
    php7.4-mysqli php7.4-curl php7.4-xml \
    php7.4-mbstring  apt-utils 

COPY ./Tools/Wordpress.sh .
COPY ./Tools/www.conf /etc/php/7.4/fpm/pool.d/www.conf
EXPOSE 9000

CMD ["bash", "Wordpress.sh"]