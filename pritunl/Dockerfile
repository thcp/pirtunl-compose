FROM alpine:3.11.6

LABEL maintainer="Thales Pereira"

ENV VERSION="1.29.1926.93"

# Install dependencies
COPY requirements.txt .
RUN \
    apk --no-cache add -u $(cat requirements.txt) \
    && pip install --upgrade pip 

# Install Pritunl
RUN \
    export GOPATH=/go \
    && go get github.com/pritunl/pritunl-dns \
    && go get github.com/pritunl/pritunl-monitor \
    && go get github.com/pritunl/pritunl-web \
    && cp /go/bin/* /usr/bin/ 

RUN \
    wget https://github.com/pritunl/pritunl/archive/${VERSION}.tar.gz \
    && tar zxvf ${VERSION}.tar.gz \
    && cd pritunl-${VERSION} \
    && python setup.py build \
    && pip install -r requirements.txt \
    && python2 setup.py install \
    && cd .. \
    && rm -rf *${VERSION}* \
    && rm -rf /tmp/* /var/cache/apk/*

RUN \
    sed -i -e '/^attributes/a prompt\t\t\t= yes' /etc/ssl/openssl.cnf \
    && sed -i -e '/countryName_max/a countryName_value\t\t= PT' /etc/ssl/openssl.cnf

ADD start.sh /start.sh

EXPOSE 80
EXPOSE 443
EXPOSE 1194
ENTRYPOINT ["/start.sh"]
