FROM alpine:latest

RUN mkdir /start
WORKDIR /start
COPY ./switch.sh /start
COPY ./port /root

RUN apk add --no-cache openssh bash tcpdump

RUN /usr/bin/ssh-keygen -A
RUN ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

RUN ["chmod", "+x", "/root/port"]
RUN ["chmod", "+x", "/start/switch.sh"]
ENTRYPOINT ["/start/switch.sh"]
