FROM alpine:3.7
RUN apk add --no-cache squid
#RUN apk add --no-cache vim
EXPOSE 3128
EXPOSE 3129
ENTRYPOINT [ "squid", "-N", "-d1" ]

