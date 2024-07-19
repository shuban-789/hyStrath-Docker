FROM ubuntu:20.04

WORKDIR $HOME

COPY build.sh .

RUN chmod +x build.sh

CMD ["bash", "FinalSetup.sh"]
