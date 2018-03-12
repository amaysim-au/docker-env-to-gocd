FROM python:3-alpine
COPY . /scripts/
WORKDIR /srv/app
CMD python /scripts/env-to-gocd.py
