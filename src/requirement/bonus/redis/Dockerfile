FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install redis -y

COPY ./Tools/redis.conf /etc/redis/redis.conf

RUN chmod -R 755 /etc/redis/*

EXPOSE 6379

CMD ["redis-server", "--protected-mode no"]

