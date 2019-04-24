FROM alpine:3.6

WORKDIR /tmp

COPY requirements.txt .

RUN apk add --no-cache --virtual build-deps python2-dev build-base \
    gcc make g++ openssl-dev  libffi-dev && \
    apk add --no-cache py-lxml libxslt-dev \
    python2 py2-pip libxml2-dev openssl ca-certificates && \
    pip install -r requirements.txt && \
    apk del build-deps

WORKDIR /tests

VOLUME tests

VOLUME output

ENTRYPOINT ["robot"]

CMD ["--help"] 
