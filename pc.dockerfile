FROM alpine:latest

RUN mkdir /start
WORKDIR /start
COPY ./pc.sh /start

RUN apk add --no-cache openssh

RUN /usr/bin/ssh-keygen -A
RUN ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

RUN ["chmod", "+x", "/start/pc.sh"]
ENTRYPOINT ["/start/pc.sh"]