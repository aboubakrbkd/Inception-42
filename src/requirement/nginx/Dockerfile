FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx openssl  apt-utils 

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/ssl_key.key \
    -out /etc/nginx/ssl/ssl_certificate.crt \
    -subj "/C=MO/ST=KH/L=KHOURIBGA/O=KHOURIBGA/OU=1337/CN=42/emailAddress=aboukdid@1337.ma"

COPY ./Tools/file.conf /etc/nginx/sites-available/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]