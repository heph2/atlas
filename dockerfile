FROM alpine:3.14

RUN apk update && \
    apk upgrade && \
    apk add perl && \
    apk add perl-io-socket-ssl && \
    apk add perl-uri && \
    apk add perl-cgi && \
    apk add perl-xml-rss && \
    apk add perl-http-daemon && \
    apk add perl-datetime-format-strptime

RUN mkdir -p /usr/atlas

WORKDIR /usr/atlas

COPY script/atlas /usr/atlas

ENTRYPOINT ["perl", "atlas"]
