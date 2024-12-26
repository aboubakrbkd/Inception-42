FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/ssl_key \
    -out /etc/nginx/ssl/ssl_certificate \
    -subj "/C=MO/ST=KH/L=KHOURIBGA/O=KHOURIBGA/OU=1337/CN=42/emailAddress=aboukdid@1337.ma"

COPY /Tools/file.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]