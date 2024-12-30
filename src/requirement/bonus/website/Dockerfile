FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx

COPY ./Tools /usr/share/nginx/html/

COPY ./Conf/web.conf /etc/nginx/sites-available/default

EXPOSE 5555

CMD ["nginx", "-g", "daemon off;"]

