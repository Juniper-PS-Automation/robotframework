# Copyright 2017 Juniper Networks, Inc. All rights reserved.
# Licensed under the Juniper Networks Script Software License (the "License").
# You may not use this script file except in compliance with the License, which is located at
# http://www.juniper.net/support/legal/scriptlicense/
# Unless required by applicable law or otherwise agreed to in writing by the parties,
# software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
# either express or implied.

FROM juniper/pyez-ansible:latest

LABEL net.juniper.ps.automation.description="base robot framework testing container" \
      net.juniper.ps.automation.maintainer="Oleg Babkin"

RUN pip install -U robotframework robotframework-selenium2library xmltodict librabbitmq pika
RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
	&& apk update && apk upgrade \
	&& python -m ensurepip && rm -r /usr/lib/python*/ensurepip \
	&& pip install --upgrade pip setuptools \
	&& apk add --no-cache --virtual .build-deps@testing make cmake clang clang-dev g++ linux-headers libtbb@testing libtbb-dev@testing openblas-dev freetype-dev tini libstdc++ openblas freetype wget ca-certificates \
        && rm -rf /var/cache/apk/*
