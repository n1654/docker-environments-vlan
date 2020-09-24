FROM alpine:3.12

RUN mkdir /start
WORKDIR /start
COPY ./switch.sh /start
COPY ./port /root
COPY snmpd.conf /etc/snmp/

RUN apk add --no-cache openssh bash tcpdump net-snmp

RUN /usr/bin/ssh-keygen -A
RUN ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

RUN ["chmod", "+x", "/root/port"]
RUN ["chmod", "+x", "/start/switch.sh"]
ENTRYPOINT ["/start/switch.sh"]
