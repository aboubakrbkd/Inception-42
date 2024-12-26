FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt install mariadb-server -y

COPY ./Tools/script.sh /var/script.sh

RUN chmod +x /var/script.sh

EXPOSE 3306

CMD ["bash", "/var/script.sh"]