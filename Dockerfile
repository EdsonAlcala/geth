FROM alpine:3.8 as geth-builder
RUN \
    apk add --update go git make gcc musl-dev linux-headers ca-certificates && \
    git clone --depth 1 https://github.com/EdsonAlcala/go-ethereum && \
    (cd go-ethereum && make geth) && \
    cp go-ethereum/build/bin/geth /

FROM alpine:3.8 

COPY --from=geth-builder /go-ethereum/build/bin/geth /usr/local/bin

RUN \
    apk add --update --no-cache bash && rm -rf /var/cache/apk/*

CMD ["geth", "version" ]