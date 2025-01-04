FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt install -y mariadb-server

COPY ./Tools/script.sh /var/script.sh

RUN chmod +x /var/script.sh

EXPOSE 3306

CMD ["bash", "/var/script.sh"]