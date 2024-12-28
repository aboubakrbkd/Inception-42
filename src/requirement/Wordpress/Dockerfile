FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y curl php7.4-fpm \
    php7.4-mysqli php7.4-curl php7.4-xml \
    php7.4-mbstring

COPY ./Tools/Wordpress.sh .

EXPOSE 9000

CMD ["bash", "Wordpress.sh"]