FROM python:3.6-alpine
LABEL maintainer "Raphael Pierzina <raphael@hackebrot.de>"

ARG PIPENV_VERSION="11.10.4"

RUN pip install pipenv=="$PIPENV_VERSION"

ENV HOME /home/user

RUN adduser -S user \
	&& chown -R user $HOME

WORKDIR $HOME
USER user
