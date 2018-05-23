FROM ubuntu:xenial
LABEL maintainer "Raphael Pierzina <raphael@hackebrot.de>"

ENV DEBIAN_FRONTEND=noninteractive \
    MOZ_HEADLESS=1 \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8

# Install requirements to install tools
RUN dependencies=' \
        bzip2 \
        ca-certificates \
        curl \
        firefox \
        python3.6 \
        python-pip \
        python-setuptools \
        python-wheel \
    ' \
    && set -x \
    && apt-get -qq update && apt-get -qq install -y software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get -qq update && apt-get -qq install --no-install-recommends -y $dependencies \
    && apt-get -y purge firefox \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# Copy install scripts
COPY bin/install-firefox.sh /usr/local/bin/install-firefox
COPY bin/install-geckodriver.sh /usr/local/bin/install-geckodriver

# Change target versions via --build-arg
ARG FIREFOX_VERSION="59.0"
ARG GECKODRIVER_VERSION="0.20.0"
ARG PIPENV_VERSION="11.10.4"

# Install Firefox and Geckodriver
RUN install-firefox
RUN install-geckodriver

# Install pipenv
RUN pip install pipenv=="$PIPENV_VERSION"
