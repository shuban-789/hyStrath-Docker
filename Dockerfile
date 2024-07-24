FROM ubuntu:20.04

WORKDIR /root

COPY build.sh .

RUN chmod +x build.sh

CMD ["bash", "build.sh"]