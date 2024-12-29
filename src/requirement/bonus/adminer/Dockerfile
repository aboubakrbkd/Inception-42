FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y adminer && \
    apt-get install -y php

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www"]