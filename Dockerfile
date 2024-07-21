FROM ubuntu:20.04

CMD ["cd", "$HOME"]

COPY build.sh .

RUN chmod +x build.sh

CMD ["bash", "build.sh"]