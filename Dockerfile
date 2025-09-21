FROM python:3.13-bookworm

COPY scripts/run.sh /usr/bin/run

RUN apt install git

RUN chmod +x /usr/bin/run

EXPOSE 8000

ENTRYPOINT ["run"]