FROM golang:1.12 as builder

WORKDIR $GOPATH/src/app
COPY ./src/app .
RUN go get -d -v
RUN go build -o /go/bin/app -ldflags "-s -w"

FROM scratch
COPY --from=builder /go/bin/app /app
ENTRYPOINT ["/app"]
