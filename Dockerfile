FROM alpine:3.21

WORKDIR /app

ENV DOCKER=1

RUN apk add --no-cache \
    ca-certificates \
    ffmpeg \
    tzdata

COPY rdio-scanner ./

RUN mkdir -p /app/data

VOLUME [ "/app/data" ]

EXPOSE 3000

ENTRYPOINT [ "./rdio-scanner", "-base_dir", "/app/data" ]
