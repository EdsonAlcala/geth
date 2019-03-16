FROM alpine:3.8 as geth-builder
RUN \
    apk add --update go git make gcc musl-dev linux-headers ca-certificates && \
    git clone --depth 1 https://github.com/EdsonAlcala/go-ethereum && \
    (cd go-ethereum && make all)

FROM alpine:3.8 

RUN apk add --update --no-cache bash ca-certificates && rm -rf /var/cache/apk/*

COPY --from=geth-builder /go-ethereum/build/bin/geth /usr/local/bin
COPY --from=geth-builder /go-ethereum/build/bin/bootnode /usr/local/bin/

CMD ["geth", "version" ]