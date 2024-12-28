FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y curl && \
    apt-get install -y php7.4-fpm

COPY ./Tools/Wordpress.sh .

EXPOSE 9000

CMD ["bash", "Wordpress.sh"]