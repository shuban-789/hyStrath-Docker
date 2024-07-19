FROM ubuntu:20.04

WORKDIR $HOME

COPY FinalSetup.sh

RUN chmod +x FinalSetup.sh

CMD ["bash", "FinalSetup.sh"]
