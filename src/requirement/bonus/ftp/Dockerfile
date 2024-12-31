FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt install -y vsftpd

COPY ./Tools/ftp.sh .

RUN chmod +x ftp.sh

CMD ["bash", "ftp.sh"]

