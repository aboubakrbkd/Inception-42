FROM    debian:bullseye

RUN apt update && apt install -y wget

RUN wget https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor-v0.47.0-linux-amd64

RUN mv cadvisor-v0.47.0-linux-amd64 cadvisor

RUN chmod +x cadvisor

CMD [ "./cadvisor" ]
