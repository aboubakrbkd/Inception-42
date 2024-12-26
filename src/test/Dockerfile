FROM python:latest

#WORKDIR is like cd and if the dorectory isnt there it 
#           will create it its like cd in the shell
WORKDIR /app

#COPY is like the cp command it copy the file inside
#   the container i told copy the requrement.txt in the container
COPY reqirement.txt .

#The RUN commad is like im inside the container and i run commands
RUN apt-get install -y

#EXPOSE is the port when the app will
EXPOSE 44



