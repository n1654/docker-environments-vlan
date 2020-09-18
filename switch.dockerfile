FROM alpine:latest

RUN mkdir /start
WORKDIR /start
COPY ./switch.sh /start

RUN apk add --no-cache openssh tcpdump

RUN /usr/bin/ssh-keygen -A
RUN ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

RUN ["chmod", "+x", "/start/switch.sh"]
ENTRYPOINT ["/start/switch.sh"]
